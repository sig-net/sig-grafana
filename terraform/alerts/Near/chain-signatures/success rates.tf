resource "grafana_rule_group" "rule_group_ab5e7f79a1339a71" {
  # org_id           = 1
  name             = "success rates"
  folder_uid       = "multichain"
  interval_seconds = 60

  rule {
    name      = "[MAINNET][SIGNATURES]Signature Success Rate/Hr"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"adhocFilters\":[],\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"code\",\"exemplar\":false,\"expr\":\" (sum (increase(multichain_sign_requests_success{environment=\\\"mainnet\\\"}[1h]))/\\n max(increase(multichain_sign_requests_count{environment=\\\"mainnet\\\"}[1h])))*100\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
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
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[95],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "64"
      description      = "Signature success rate has been below 95% for 5 min: {{ $values.A }}%"
      summary          = "[MAINNET][SIGNATURES] Success Rate below 95%"
    }
    is_paused = true

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET][SIGNATURES]Signature Success Rate/Hr"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"adhocFilters\":[],\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"code\",\"exemplar\":false,\"expr\":\" (sum (increase(multichain_sign_requests_success{environment=\\\"testnet\\\"}[1h]))/\\n max(increase(multichain_sign_requests_count{environment=\\\"testnet\\\"}[1h])))*100\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
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
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[95],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "64"
      description      = "Signature success rate has been below 95% for 5 mins: {{ $values.A }}%"
      summary          = "[TESTNET][SIGNATURES] Success rate below 95%"
    }
    is_paused = true

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV] [PRESIGNATURE] Generator Success Rate Per Hour"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 43200
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"editorMode\":\"code\",\"expr\":\"sum by(node_account_id) (rate(multichain_num_total_historical_presignature_generators_success{node_account_id=~\\\"(multichain-node-dev-0\\\\\\\\.testnet|multichain-node-dev-1\\\\\\\\.testnet|multichain-node-dev-2\\\\\\\\.testnet|multichain-node-dev-3\\\\\\\\.testnet|multichain-node-dev-4\\\\\\\\.testnet|multichain-node-dev-5\\\\\\\\.testnet|multichain-node-dev-6\\\\\\\\.testnet|multichain-node-dev-7\\\\\\\\.testnet)\\\"}[1h]) / rate(multichain_num_total_historical_presignature_generators{node_account_id=~\\\"(multichain-node-dev-0\\\\\\\\.testnet|multichain-node-dev-1\\\\\\\\.testnet|multichain-node-dev-2\\\\\\\\.testnet|multichain-node-dev-3\\\\\\\\.testnet|multichain-node-dev-4\\\\\\\\.testnet|multichain-node-dev-5\\\\\\\\.testnet|multichain-node-dev-6\\\\\\\\.testnet|multichain-node-dev-7\\\\\\\\.testnet)\\\"}[1h]))\",\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\"}"
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
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.95],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "KeepLast"
    exec_err_state = "KeepLast"
    for            = "15m"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "46"
    }
    is_paused = true

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET] [PRESIGNATURE] Generator Success Rate Per Hour"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 43200
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"editorMode\":\"code\",\"expr\":\"sum by(node_account_id) (rate(multichain_num_total_historical_presignature_generators_success{node_account_id=~\\\"(blacksandtech\\\\\\\\.near|et-mpc-node\\\\\\\\.near|infstones\\\\\\\\.near|lifted-mainnet\\\\\\\\.near|mpc-lgns\\\\\\\\.near|multichain-mainnet-aurora\\\\\\\\.near|near-mpc-staking4all-01\\\\\\\\.near|nodemonster\\\\\\\\.near)\\\"}[1h]) / rate(multichain_num_total_historical_presignature_generators{node_account_id=~\\\"(blacksandtech\\\\\\\\.near|et-mpc-node\\\\\\\\.near|infstones\\\\\\\\.near|lifted-mainnet\\\\\\\\.near|mpc-lgns\\\\\\\\.near|multichain-mainnet-aurora\\\\\\\\.near|near-mpc-staking4all-01\\\\\\\\.near|nodemonster\\\\\\\\.near)\\\"}[1h]))\",\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\"}"
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
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.95],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "15m"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "46"
    }
    is_paused = true

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][SIGNATURES]Signature Success Rate/Hr"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"adhocFilters\":[],\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"code\",\"exemplar\":false,\"expr\":\" (sum (increase(multichain_sign_requests_success{environment=\\\"dev\\\"}[1h]))/\\n max(increase(multichain_sign_requests_count{environment=\\\"dev\\\"}[1h])))*100\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
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
      __panelId__      = "64"
      description      = "Signature success rate has been below 50% for 5 mins: {{ $values.A }}%"
      summary          = "[DEV][SIGNATURES] Success rate below 50%"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
}
