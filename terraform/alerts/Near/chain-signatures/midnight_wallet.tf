data "google_secret_manager_secret_version" "contract_pinger_api_secret" {
  project = "near-cs-dev"
  secret  = "contract-pinger-api-secret-dev"
}

# Sends the pinger's API secret as a secure header, kept out of every query
# and export, and only to the pinger.
resource "grafana_data_source" "contract_pinger" {
  type = "yesoreyeram-infinity-datasource"
  name = "Contract Pinger"

  json_data_encoded = jsonencode({
    allowedHosts    = ["https://contract-ping.sig.network"]
    httpHeaderName1 = "x-api-secret"
  })
  secure_json_data_encoded = jsonencode({
    httpHeaderValue1 = data.google_secret_manager_secret_version.contract_pinger_api_secret.secret_data
  })
}

locals {
  midnight_wallet_query = {
    datasource = {
      type = "yesoreyeram-infinity-datasource"
      uid  = grafana_data_source.contract_pinger.uid
    }
    type        = "json"
    source      = "url"
    parser      = "backend"
    format      = "table"
    url         = "https://contract-ping.sig.network/midnight/wallet"
    url_options = { method = "GET" }
  }
}

# The one Midnight wallet pays fees for the dev and testnet MPCs. The pinger
# answers 503 until a Midnight job opens it and while it cannot sync, so an
# error alerts too.
resource "grafana_rule_group" "midnight_wallet" {
  name             = "midnight-wallet"
  folder_uid       = "multichain"
  interval_seconds = 300

  rule {
    name      = "[DEV/TESTNET][MIDNIGHT][BALANCE] Contract Pinger DUST"
    condition = "C"

    data {
      ref_id = "A"
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = grafana_data_source.contract_pinger.uid
      model = jsonencode(merge(local.midnight_wallet_query, {
        refId   = "A"
        columns = [{ selector = "dust", text = "DUST", type = "number" }]
      }))
    }
    data {
      ref_id = "B"
      relative_time_range {
        from = 0
        to   = 0
      }
      datasource_uid = "__expr__"
      model = jsonencode({
        refId      = "B"
        type       = "reduce"
        expression = "A"
        reducer    = "last"
        datasource = { type = "__expr__", uid = "__expr__" }
      })
    }
    data {
      ref_id = "C"
      relative_time_range {
        from = 0
        to   = 0
      }
      datasource_uid = "__expr__"
      model = jsonencode({
        refId      = "C"
        type       = "threshold"
        expression = "B"
        conditions = [{ evaluator = { type = "lt", params = [5000] } }]
        datasource = { type = "__expr__", uid = "__expr__" }
      })
    }

    no_data_state  = "Alerting"
    exec_err_state = "Alerting"
    # A restarted pinger opens the wallet with its first Midnight job.
    for = "15m"
    annotations = {
      description = "The contract pinger's Midnight wallet holds {{ $values.B }} DUST, under 5,000 (about 10,000 round trips). It pays 0.5 DUST a round trip and its NIGHT regenerates DUST, so a falling balance means its NIGHT stopped generating. Top up with pnpm fund:midnight."
    }
    is_paused = false

    notification_settings {
      contact_point = "SRE On-call"
      group_by      = null
      mute_timings  = null
    }
  }

  rule {
    name      = "[DEV/TESTNET][MIDNIGHT][BALANCE] Contract Pinger fee coins"
    condition = "C"

    data {
      ref_id = "A"
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = grafana_data_source.contract_pinger.uid
      model = jsonencode(merge(local.midnight_wallet_query, {
        refId   = "A"
        columns = [{ selector = "feeCoins", text = "Fee coins", type = "number" }]
      }))
    }
    data {
      ref_id = "D"
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = grafana_data_source.contract_pinger.uid
      model = jsonencode(merge(local.midnight_wallet_query, {
        refId   = "D"
        columns = [{ selector = "feeCoinsNeeded", text = "Needed", type = "number" }]
      }))
    }
    data {
      ref_id = "B"
      relative_time_range {
        from = 0
        to   = 0
      }
      datasource_uid = "__expr__"
      model = jsonencode({
        refId      = "B"
        type       = "math"
        expression = "$A - $D"
        datasource = { type = "__expr__", uid = "__expr__" }
      })
    }
    data {
      ref_id = "C"
      relative_time_range {
        from = 0
        to   = 0
      }
      datasource_uid = "__expr__"
      model = jsonencode({
        refId      = "C"
        type       = "threshold"
        expression = "B"
        conditions = [{ evaluator = { type = "lt", params = [0] } }]
        datasource = { type = "__expr__", uid = "__expr__" }
      })
    }

    no_data_state  = "Alerting"
    exec_err_state = "Alerting"
    for            = "15m"
    annotations = {
      description = "The contract pinger's Midnight wallet is {{ $values.B }} fee coins off what its callers' slots need. A transaction holds one until it lands, so transactions queue for them. Split its NIGHT with pnpm fund:midnight."
    }
    is_paused = false

    notification_settings {
      contact_point = "SRE On-call"
      group_by      = null
      mute_timings  = null
    }
  }
}
