resource "grafana_dashboard" "chain_signatures" {
  folder      = "multichain"
  config_json = file("./account-balances.json")

  depends_on = [
    grafana_data_source.alchemy_nonprod,
    grafana_data_source.alchemy_mainnet,
    grafana_data_source.alchemy_eth_sepolia,
    grafana_data_source.alchemy_eth_mainnet,
  ]
}
