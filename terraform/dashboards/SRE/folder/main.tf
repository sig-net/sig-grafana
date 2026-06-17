resource "grafana_folder" "sre" {
  title = "SRE"
  uid   = "befk4ud4xv5s0d"
}

import {
  to = grafana_folder.sre
  id = "befk4ud4xv5s0d"
}
