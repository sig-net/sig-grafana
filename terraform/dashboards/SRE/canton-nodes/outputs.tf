output "folder_uid" {
  value = grafana_folder.sre.uid
}

output "dashboard_uid" {
  value = grafana_dashboard.canton_nodes.uid
}
