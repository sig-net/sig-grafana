resource "grafana_dashboard" "chain_signatures" {
  folder = "multichain"
  config_json = file("./account-balances.json")
}