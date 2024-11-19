locals {
  static_envs = {
    GF_LOG_LEVEL = "DEBUG"
  }
}

resource "google_secret_manager_secret" "grafana_cloud_pswd" {
  secret_id = "grafana_cloud_pswd"
  replication {
    auto {

    }
  }
}

resource "google_secret_manager_secret" "agent_config" {
  secret_id = "grafana_agent_config"
  replication {
    auto {

    }
  }
}

resource "google_secret_manager_secret_version" "agent_config_version" {
  secret      = google_secret_manager_secret.agent_config.id
  secret_data = file("${var.file_path}")
}


resource "google_cloud_run_service" "grafana_agent" {
  provider                   = google-beta
  name                       = var.service
  location                   = var.location
  project                    = var.project_id
  autogenerate_revision_name = true

  template {
    spec {
      service_account_name = google_service_account.grafana_agent_sa.email
      containers {
        args  = ["-config.expand-env", "-config.file", "/agent/agent.yaml", "-server.http.address", "0.0.0.0:8080"]
        image = var.image
        ports {
          name           = "http1"
          container_port = 8080
        }
        dynamic "env" {
          for_each = local.static_envs
          content {
            name  = env.key
            value = env.value
          }
        }
        env {
          name = "GRAFANA_CLOUD_PSWD"
          value_from {
            secret_key_ref {
              name = google_secret_manager_secret.grafana_cloud_pswd.secret_id
              key  = "latest"
            }
          }
        }
        env {
          name = "GRAFANA_USERNAME"
          value_from {
            secret_key_ref {
              name = "grafana-username"
              key  = "latest"
            }
          }
        }
        env {
          name = "GRAFANA_PUSH_URL"
          value_from {
            secret_key_ref {
              name = "prom-push-url"
              key  = "latest"
            }
          }
        }
        volume_mounts {
          name       = "agent-config"
          mount_path = "/agent"
        }
      }
      volumes {
        name = "agent-config"
        secret {
          secret_name = google_secret_manager_secret.agent_config.secret_id
          items {
            key  = "latest"
            path = "agent.yaml"
          }
        }
      }
    }
    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale"        = "1"
        "run.googleapis.com/cpu-throttling"       = false
        "run.googleapis.com/vpc-access-connector" = var.vpc_connector
        "run.googleapis.com/vpc-access-egress"    = "all-traffic"
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [
    google_secret_manager_secret_version.agent_config_version
  ]

  lifecycle {
    # List of fields we don't want to see a diff for in terraform. Most of these fields are set
    # by GCP and is metadata we don't want to account when considering changes in the service.
    ignore_changes = [
      template[0].metadata[0].labels["client.knative.dev/nonce"],
      template[0].metadata[0].labels["run.googleapis.com/startupProbeType"],
      template[0].metadata[0].annotations["run.googleapis.com/client-name"],
    ]
  }
}
