resource "grafana_rule_group" "midnight_balances" {
  name             = "midnight balances"
  folder_uid       = "multichain"
  interval_seconds = 60

  rule {
    name      = "[DEV][MIDNIGHT][BALANCE] Node DUST low"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"datasource\": {\"type\": \"prometheus\", \"uid\": \"grafanacloud-prom\"}, \"editorMode\": \"code\", \"expr\": \"multichain_funding_wallet_balance{chain=\\\"Midnight\\\", environment=\\\"dev\\\"}\", \"instant\": true, \"intervalMs\": 60000, \"legendFormat\": \"__auto\", \"maxDataPoints\": 43200, \"range\": false, \"refId\": \"A\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\": [{\"evaluator\": {\"params\": [], \"type\": \"gt\"}, \"operator\": {\"type\": \"and\"}, \"query\": {\"params\": [\"B\"]}, \"reducer\": {\"params\": [], \"type\": \"last\"}, \"type\": \"query\"}], \"datasource\": {\"type\": \"__expr__\", \"uid\": \"__expr__\"}, \"expression\": \"A\", \"intervalMs\": 1000, \"maxDataPoints\": 43200, \"reducer\": \"last\", \"refId\": \"B\", \"type\": \"reduce\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\": [{\"evaluator\": {\"params\": [10000], \"type\": \"lt\"}, \"operator\": {\"type\": \"and\"}, \"query\": {\"params\": [\"C\"]}, \"reducer\": {\"params\": [], \"type\": \"last\"}, \"type\": \"query\"}], \"datasource\": {\"type\": \"__expr__\", \"uid\": \"__expr__\"}, \"expression\": \"B\", \"intervalMs\": 1000, \"maxDataPoints\": 43200, \"refId\": \"C\", \"type\": \"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "15m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "99"
      description      = "{{ $labels.node_account_id }} has {{ $values.B }} DUST in its Midnight funding wallet, read before its last landed publish. Top up NIGHT so DUST regenerates."
      summary          = "[DEV][MIDNIGHT] Node funding wallet DUST below 10,000"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }

  rule {
    name      = "[DEV][MIDNIGHT][PUBLISH] Wallet unfunded refusals"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"datasource\": {\"type\": \"prometheus\", \"uid\": \"grafanacloud-prom\"}, \"editorMode\": \"code\", \"expr\": \"sum by (node_account_id) (increase(multichain_publish_refusals{chain=\\\"Midnight\\\", environment=\\\"dev\\\", code=\\\"wallet_unfunded\\\"}[15m]))\", \"instant\": true, \"intervalMs\": 60000, \"legendFormat\": \"__auto\", \"maxDataPoints\": 43200, \"range\": false, \"refId\": \"A\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\": [{\"evaluator\": {\"params\": [], \"type\": \"gt\"}, \"operator\": {\"type\": \"and\"}, \"query\": {\"params\": [\"B\"]}, \"reducer\": {\"params\": [], \"type\": \"last\"}, \"type\": \"query\"}], \"datasource\": {\"type\": \"__expr__\", \"uid\": \"__expr__\"}, \"expression\": \"A\", \"intervalMs\": 1000, \"maxDataPoints\": 43200, \"reducer\": \"last\", \"refId\": \"B\", \"type\": \"reduce\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\": [{\"evaluator\": {\"params\": [0], \"type\": \"gt\"}, \"operator\": {\"type\": \"and\"}, \"query\": {\"params\": [\"C\"]}, \"reducer\": {\"params\": [], \"type\": \"last\"}, \"type\": \"query\"}], \"datasource\": {\"type\": \"__expr__\", \"uid\": \"__expr__\"}, \"expression\": \"B\", \"intervalMs\": 1000, \"maxDataPoints\": 43200, \"refId\": \"C\", \"type\": \"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      description = "{{ $labels.node_account_id }} had {{ $values.B }} Midnight publishes refused as wallet_unfunded in 15m. The DUST gauge only updates on landed publishes, so this is the signal that the wallet actually ran dry."
      summary     = "[DEV][MIDNIGHT] Midnight publishes refused: wallet unfunded"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
}
