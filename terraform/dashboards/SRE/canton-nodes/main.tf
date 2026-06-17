locals {
  sre_folder_uid = "befk4ud4xv5s0d"
}

resource "grafana_dashboard" "canton_nodes" {
  folder      = local.sre_folder_uid
  config_json = file("${path.module}/canton_nodes.json")
}
