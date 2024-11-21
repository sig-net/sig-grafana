locals {
  static_envs = {
    NEXT_PUBLIC_NETWORK_ID = "mainnet"
  }
}

resource "google_service_account" "service_account" {
  account_id   = "contract-ping-mainnet"
  display_name = "contract-pinger-mainnet"
}

resource "google_project_iam_member" "sa-roles" {
  for_each = toset([
    "roles/run.invoker",
    "roles/secretmanager.admin",
    "roles/storage.objectAdmin",
    "roles/logging.logWriter",
  ])

  role    = each.key
  member  = "serviceAccount:${google_service_account.service_account.email}"
  project = var.project_id
}

resource "google_cloud_run_service" "contract_ping" {
  provider                   = google-beta
  name                       = "contract-pinger-mainnet"
  location                   = var.location
  project                    = var.project_id
  autogenerate_revision_name = true

  template {
    spec {
      service_account_name = google_service_account.service_account.email
      containers {
        args  = ["node", "dist/server.js"]
        image = "europe-west1-docker.pkg.dev/near-cs-mainnet/tools/contract-pinger:latest"
        ports {
          name           = "http1"
          container_port = 3000
        }
        dynamic "env" {
          for_each = local.static_envs
          content {
            name  = env.key
            value = env.value
          }
        }
        env {
          name = "NEXT_PUBLIC_NEAR_ACCOUNT_ID"
          value_from {
            secret_key_ref {
              name = "contract_ping_near_account_id"
              key  = "latest"
            }
          }
        }
        env {
          name = "NEXT_PUBLIC_NEAR_PRIVATE_KEY"
          value_from {
            secret_key_ref {
              name = "contract_ping_near_private_key_mainnet"
              key  = "latest"
            }
          }
        }
        env {
          name = "NEXT_PUBLIC_CHAIN_SIGNATURE_CONTRACT"
          value_from {
            secret_key_ref {
              name = "chain-sig-mainnet-contract"
              key  = "latest"
            }
          }
        }
      }
    }
    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale"  = "1"
        "run.googleapis.com/cpu-throttling" = false
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }

  lifecycle {
    # List of fields we don't want to see a diff for in terraform. Most of these fields are set
    # by GCP and is metadata we don't want to account when considering changes in the service.
    ignore_changes = [
      template[0].metadata[0].labels["client.knative.dev/nonce"],
      template[0].metadata[0].labels["run.googleapis.com/startupProbeType"],
      template[0].metadata[0].annotations["run.googleapis.com/client-name"],
    ]
  }
  depends_on = [google_service_account.service_account]
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.contract_ping.location
  project  = google_cloud_run_service.contract_ping.project
  service  = google_cloud_run_service.contract_ping.name

  policy_data = data.google_iam_policy.noauth.policy_data
}