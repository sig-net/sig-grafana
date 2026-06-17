output "folder_uid" {
  value = local.sre_folder_uid
}

output "dashboard_uids" {
  value = {
    dev     = grafana_dashboard.dev_node_hardware.uid
    mainnet = grafana_dashboard.mainnet_node_hardware.uid
    testnet = grafana_dashboard.testnet_node_hardware.uid
  }
}
