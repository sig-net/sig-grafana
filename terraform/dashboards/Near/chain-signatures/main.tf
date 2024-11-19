resource "grafana_folder" "multichain" {
  title = "Multichain"
  uid = "multichain"
}

resource "grafana_dashboard" "chain_signatures" {
  folder = grafana_folder.multichain.uid
  config_json = file("./chain_sig_new.json")
}