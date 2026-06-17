output "folder_uid" {
  value = local.sre_folder_uid
}

output "dashboard_uid" {
  value = grafana_dashboard.canton_nodes.uid
}
