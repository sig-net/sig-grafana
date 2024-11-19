resource "grafana_rule_group" "rule_group_52a0e1fab90ce868" {
  # org_id           = 1
  name             = "multichain_default_1m"
  folder_uid       = "multichain"
  interval_seconds = 60

  rule {
    name      = "[DEV] [PRESIGNATURES] Number of Mine Presignatures"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 25200
        to   = 18000
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"builder\",\"expr\":\"max by(node_account_id) (multichain_num_presignatures_mine{environment=\\\"dev\\\"})\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
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
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "KeepLast"
    exec_err_state = "Error"
    for            = "10m"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "11"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET] [PRESIGNATURE] Number of Mine Presignatures"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 25200
        to   = 18000
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"builder\",\"expr\":\"max by(node_account_id) (multichain_num_presignatures_mine{environment=\\\"mainnet\\\"})\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 25200
        to   = 18000
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"B\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"B\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 25200
        to   = 18000
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "KeepLast"
    exec_err_state = "Error"
    for            = "10m"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "11"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET] [PRESIGNATURE] Number of Mine Presignatures"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 25200
        to   = 18000
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"builder\",\"expr\":\"max by(node_account_id) (multichain_num_presignatures_mine{environment=\\\"testnet\\\"})\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
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
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "KeepLast"
    exec_err_state = "Error"
    for            = "10m"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "11"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET] [PRESIGNATURE] Generator Success Rate Per Hour"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 43200
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"editorMode\":\"code\",\"expr\":\"sum by(node_account_id) (rate(multichain_num_total_historical_presignature_generators_success{node_account_id=~\\\"(aurora-multichain\\\\\\\\.testnet|bst-near\\\\\\\\.testnet|infstones_nearmpc\\\\\\\\.testnet|lifted-near\\\\\\\\.testnet|mpc-lgns\\\\\\\\.testnet|near-mpc-staking4all-01\\\\\\\\.testnet|nodemonster\\\\\\\\.testnet|pagoda-multichain\\\\\\\\.testnet)\\\"}[1h]) / rate(multichain_num_total_historical_presignature_generators{node_account_id=~\\\"(aurora-multichain\\\\\\\\.testnet|bst-near\\\\\\\\.testnet|infstones_nearmpc\\\\\\\\.testnet|lifted-near\\\\\\\\.testnet|mpc-lgns\\\\\\\\.testnet|near-mpc-staking4all-01\\\\\\\\.testnet|nodemonster\\\\\\\\.testnet|pagoda-multichain\\\\\\\\.testnet)\\\"}[1h]))\",\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\"}"
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
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV] [TRIPLES] Number of Mine Triples"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 25200
        to   = 18000
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"builder\",\"expr\":\"multichain_num_triples_mine{environment=\\\"dev\\\"}\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
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
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "KeepLast"
    exec_err_state = "Alerting"
    for            = "10m"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "11"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET] [TRIPLES] Number of Mine Triples"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 25200
        to   = 18000
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"builder\",\"expr\":\"multichain_num_triples_mine{environment=\\\"mainnet\\\"}\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 25200
        to   = 18000
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"B\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"B\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 25200
        to   = 18000
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "KeepLast"
    exec_err_state = "Alerting"
    for            = "10m"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "11"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET] [TRIPLES] Number of Mine Triples (copy)"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 25200
        to   = 18000
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"builder\",\"expr\":\"multichain_num_triples_mine{environment=\\\"testnet\\\"}\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
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
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "KeepLast"
    exec_err_state = "Alerting"
    for            = "10m"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "11"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
}
