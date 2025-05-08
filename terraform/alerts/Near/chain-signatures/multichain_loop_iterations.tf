resource "grafana_rule_group" "rule_group_06a869a8aabfd2fb" {
  # org_id           = 1
  name             = "multichain loop iterations"
  folder_uid       = "multichain"
  interval_seconds = 60

  rule {
    name      = "[MAINNET][ITER]Main loop iterations (finish)"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 3600
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"adhocFilters\":[],\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"editorMode\":\"code\",\"expr\":\"increase(multichain_protocol_iter_total_count{node_account_id=~\\\"(sig.stakin\\\\\\\\.near|node.sig-net\\\\\\\\.near|lifted-sig\\\\\\\\.near|taxistake-sig\\\\\\\\.near|natsai-bp\\\\\\\\.near|sig-mpc-staking4all-01\\\\\\\\.near|luganodes\\\\\\\\.near|sig-piertwo\\\\\\\\.near)\\\"}[5m])\",\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"B\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"B\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[50],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "66"
      description      = "Main loop iterations have slowed to {{ $values.A }}/min on node {{ $labels.node_account_id }}"
      summary          = "[MAINNET][ITER]Main loop iterations below 50/min"
    }
    is_paused = true

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET][ITER]Main loop iterations (finish)"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 3600
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"adhocFilters\":[],\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"editorMode\":\"code\",\"expr\":\"increase(multichain_protocol_iter_total_count{node_account_id=~\\\"(multichain-node-dev-0\\\\\\\\.testnet|multichain-node-dev-1\\\\\\\\.testnet|multichain-node-dev-2\\\\\\\\.testnet|multichain-node-dev-3\\\\\\\\.testnet|multichain-node-dev-4\\\\\\\\.testnet|multichain-node-dev-5\\\\\\\\.testnet|multichain-node-dev-6\\\\\\\\.testnet|multichain-node-dev-7\\\\\\\\.testnet)\\\"}[5m])\",\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"B\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"B\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[50],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "66"
      description      = "Main loop iterations have slowed to {{ $values.A }}/min on node {{ $labels.node_account_id }}"
      summary          = "[TESTNET][ITER]Main loop iterations below 50/min"
    }
    is_paused = true

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][ITER]Main loop iterations (finish)"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 300
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"adhocFilters\":[],\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"editorMode\":\"code\",\"expr\":\"increase(multichain_protocol_iter_total_count{node_account_id=~\\\"(multichain-node-dev-0\\\\\\\\.testnet|multichain-node-dev-1\\\\\\\\.testnet|multichain-node-dev-10\\\\\\\\.testnet|multichain-node-dev-11\\\\\\\\.testnet|multichain-node-dev-2\\\\\\\\.testnet|multichain-node-dev-3\\\\\\\\.testnet|multichain-node-dev-4\\\\\\\\.testnet|multichain-node-dev-5\\\\\\\\.testnet|multichain-node-dev-6\\\\\\\\.testnet|multichain-node-dev-7\\\\\\\\.testnet|multichain-node-dev-8\\\\\\\\.testnet|multichain-node-dev-9\\\\\\\\.testnet)\\\"}[5m])\",\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"B\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"B\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[50],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "66"
      description      = "Main loop iterations have slowed to {{ $values.A }}/min on node {{ $labels.node_account_id }}"
      summary          = "[DEV][ITER]Main loop iterations less than 50/min"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
}
