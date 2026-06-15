resource "grafana_folder" "sre" {
  title = "SRE"
  uid   = "sre"
}

resource "grafana_dashboard" "canton_nodes" {
  folder      = grafana_folder.sre.uid
  config_json = file("${path.module}/canton_nodes.json")
}
