terraform {
  backend "gcs" {
    bucket = "sig-infra-terraform"
    prefix = "terraform/grafana/dashboards/balances"
  }

  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "3.10.0"
    }
  }
}


provider "grafana" {
  url  = data.google_secret_manager_secret_version.grafana_cloud_url.secret_data
  auth = data.google_secret_manager_secret_version.dashboard_token.secret_data
}


data "google_secret_manager_secret_version" "dashboard_token" {
  project = "sig-bootstrap"
  secret  = "grafana_cloud_dashboards_token"
  version = "2"
}

data "google_secret_manager_secret_version" "grafana_cloud_url" {
  project = "sig-bootstrap"
  secret  = "grafana-cloud-url"
}

data "google_secret_manager_secret_version" "alchemy_api_key_nonprod" {
  project = "sig-bootstrap"
  secret  = "alchemy-api-key-nonprod"
}

data "google_secret_manager_secret_version" "alchemy_api_key_mainnet" {
  project = "sig-bootstrap"
  secret  = "alchemy-api-key-mainnet"
}

resource "grafana_data_source" "alchemy_nonprod" {
  type = "yesoreyeram-infinity-datasource"
  name = "Alchemy non-production"
  uid  = "alchemy-nonprod-balances"

  json_data_encoded = jsonencode({
    auth_method = "bearerToken"
    allowedHosts = [
      "https://solana-devnet.g.alchemy.com",
      "https://eth-sepolia.g.alchemy.com",
    ]
  })

  secure_json_data_encoded = jsonencode({
    bearerToken = data.google_secret_manager_secret_version.alchemy_api_key_nonprod.secret_data
  })
}

resource "grafana_data_source" "alchemy_mainnet" {
  type = "yesoreyeram-infinity-datasource"
  name = "Alchemy mainnet"
  uid  = "alchemy-mainnet-balances"

  json_data_encoded = jsonencode({
    auth_method = "bearerToken"
    allowedHosts = [
      "https://solana-mainnet.g.alchemy.com",
      "https://eth-mainnet.g.alchemy.com",
    ]
  })

  secure_json_data_encoded = jsonencode({
    bearerToken = data.google_secret_manager_secret_version.alchemy_api_key_mainnet.secret_data
  })
}
