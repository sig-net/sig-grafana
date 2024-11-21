terraform {
  backend "gcs" {
    bucket = "sig-infra-terraform"
    prefix = "terraform/grafana/dashboards"
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