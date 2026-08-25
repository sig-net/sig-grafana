locals {
  sre_folder_uid = "befk4ud4xv5s0d"
}

resource "grafana_dashboard" "near_kubernetes_workloads" {
  folder      = local.sre_folder_uid
  config_json = file("${path.module}/near_kubernetes_workloads.json")
}
