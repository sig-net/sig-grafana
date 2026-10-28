# The contract pinger's one Midnight wallet pays fees for the dev and testnet
# MPCs. DUST is shielded, so only the pinger's synced wallet can report it,
# through GET /midnight/wallet.
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
    url         = "/midnight/wallet"
    url_options = { method = "GET" }
  }
}

resource "grafana_rule_group" "midnight_wallet" {
  name             = "midnight wallet"
  folder_uid       = "multichain"
  interval_seconds = 300

  # The endpoint always answers 200. `wanted` is 1 while a Midnight job runs or
  # ran in the last 15 minutes; `ready` is 1 once the wallet is open and synced.
  # A session gets 10 minutes to open after a restart, so 15m outlasts it.
  rule {
    name      = "[DEV/TESTNET][MIDNIGHT][PINGER] Wallet not ready"
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
        columns = [{ selector = "ready", text = "Ready", type = "number" }]
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
        columns = [{ selector = "wanted", text = "Wanted", type = "number" }]
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
        expression = "$D * (1 - $A)"
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
        conditions = [{ evaluator = { type = "gt", params = [0] } }]
        datasource = { type = "__expr__", uid = "__expr__" }
      })
    }

    no_data_state  = "Alerting"
    exec_err_state = "Alerting"
    for            = "15m"
    annotations = {
      summary     = "[DEV/TESTNET][MIDNIGHT] Contract pinger Midnight wallet not ready while jobs need it"
      description = "The contract pinger's Midnight wallet has not been open and synced for 15 minutes while Midnight jobs need it, so every Midnight job fails at submission. Check the pinger's logs and restart it if the wallet does not sync."
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }

  # Balances are reported only while the wallet is ready; the rule above covers
  # the gap, so no data here stays NoData.
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

    no_data_state  = "NoData"
    exec_err_state = "Alerting"
    for            = "15m"
    annotations = {
      summary     = "[DEV/TESTNET][MIDNIGHT] Contract pinger Midnight wallet DUST below 5,000"
      description = "The contract pinger's Midnight wallet holds {{ $values.B }} DUST, under 5,000 (about 10,000 round trips at 0.5 DUST each). Its NIGHT regenerates DUST, so a falling balance means its NIGHT stopped generating. Top up with pnpm fund:midnight."
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
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

    no_data_state  = "NoData"
    exec_err_state = "Alerting"
    for            = "15m"
    annotations = {
      summary     = "[DEV/TESTNET][MIDNIGHT] Contract pinger Midnight wallet short of fee coins"
      description = "The contract pinger's Midnight wallet is {{ $values.B }} fee coins off what its callers' slots need. A transaction holds one DUST coin until it lands, so transactions queue for them. Split its NIGHT with pnpm fund:midnight."
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
}
