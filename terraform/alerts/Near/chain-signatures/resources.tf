terraform {
  backend "gcs" {
    bucket = "sig-infra-terraform"
    prefix = "terraform/grafana/alerts"
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
  auth = data.google_secret_manager_secret_version.alert_token.secret_data
}


data "google_secret_manager_secret_version" "alert_token" {
  project = "sig-bootstrap"
  secret  = "grafana_cloud_dashboards_token"
}

data "google_secret_manager_secret_version" "grafana_cloud_url" {
  project = "sig-bootstrap"
  secret  = "grafana-cloud-url"
}

data "google_secret_manager_secret_version" "mpc_alerts_url" {
  project = "sig-bootstrap"
  secret  = "mpc-alerts-url"
}

data "google_secret_manager_secret_version" "multichain_dev_url" {
  project = "sig-bootstrap"
  secret  = "multichain-dev-url"
}

data "google_secret_manager_secret_version" "alchemy_api_key_nonprod" {
  project = "sig-bootstrap"
  secret  = "alchemy-api-key-nonprod"
}

resource "grafana_data_source" "alchemy_nonprod" {
  type = "yesoreyeram-infinity-datasource"
  name = "Alchemy non-production alerts"
  uid  = "alchemy-nonprod-alerts"
  url  = "https://solana-devnet.g.alchemy.com/v2"

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
