resource "grafana_contact_point" "contact_point_cd471fc9f103b74e" {
  name = "MPC Alerts"

  oncall {
    url         = data.google_secret_manager_secret_version.mpc_alerts_url.secret_data
    http_method = "POST"
  }
}
