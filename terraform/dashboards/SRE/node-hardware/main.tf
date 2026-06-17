locals {
  sre_folder_uid = "befk4ud4xv5s0d"
}

resource "grafana_dashboard" "dev_node_hardware" {
  folder      = local.sre_folder_uid
  config_json = file("${path.module}/dev_node_hardware.json")
}

resource "grafana_dashboard" "mainnet_node_hardware" {
  folder      = local.sre_folder_uid
  config_json = file("${path.module}/mainnet_node_hardware.json")
}

resource "grafana_dashboard" "testnet_node_hardware" {
  folder      = local.sre_folder_uid
  config_json = file("${path.module}/testnet_node_hardware.json")
}
