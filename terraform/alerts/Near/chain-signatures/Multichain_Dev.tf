resource "grafana_contact_point" "contact_point_4ee4915a0aaeafe6" {
  name = "Multichain Dev"

  oncall {
    url = data.google_secret_manager_secret_version.multichain_dev_url.secret_data
  }
}
