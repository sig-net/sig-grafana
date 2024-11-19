resource "google_service_account" "grafana_agent_sa" {
  account_id   = var.account_id
  display_name = var.display_name
}

# resource "google_cloud_run_service_iam_member" "grafana_agent_sa_dev_role" {
#   location = "europe-west1"
#   service  = var.service
#   role     = "roles/run.admin"
#   member   = "serviceAccount:${google_service_account.grafana_agent_sa.email}"
#   # depends_on = [ google_cloud_run_service.grafana_agent ]
# }

locals {
  secret_ids = [
    "grafana_agent_config",
    "grafana_cloud_pswd",
    "grafana-username",
    "prom-push-url",
  ]
}

resource "google_secret_manager_secret_iam_member" "dev-secret-access" {
  for_each  = toset(local.secret_ids)
  secret_id = each.value
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.grafana_agent_sa.email}"
}