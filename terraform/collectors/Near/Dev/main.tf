module "dev_prom_collector" {
  source        = "../../../modules/collector"
  project_id    = var.project_id
  image         = "europe-west1-docker.pkg.dev/near-cs-dev/third-party/grafana/agent:latest"
  vpc_connector = "projects/sig-shared-network/locations/europe-west1/connectors/dev-eu-west1-connector"
  service       = "grafana-agent-dev"
}