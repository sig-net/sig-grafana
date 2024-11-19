resource "grafana_rule_group" "rule_group_eeaacef7b4929940" {
  # org_id           = 1
  name             = "balances"
  folder_uid       = "multichain"
  interval_seconds = 60

  rule {
    name      = "[DEV] [BALANCE] multichain-node-dev-0.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"multichain-node-dev-0.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"multichain-node-dev-0.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET] [BALANCE] et-mpc-node.near (our node)"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.mainnet.near.org\",\"url_options\":{\"body_content_type\":\"application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"et-mpc-node.near\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"et-mpc-node.near\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\",\"unloadEvaluator\":{\"params\":[10],\"type\":\"gt\"}}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "1"
      description      = "et-mpc-node.near balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET] [BALANCE] pagoda-multichain.testnet (our node)"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"pagoda-multichain.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"pagoda-multichain.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\",\"unloadEvaluator\":{\"params\":[10],\"type\":\"gt\"}}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "2"
      description      = "Testnet account pagoda-multichain.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET] [BALANCE]  ping-account.near"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.mainnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"ping-account.near\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"ping-account.near\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "7"
      description      = "Contract Pinger Mainnet account ping-account.near account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET] [BALANCE] ping-account.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"ping-account.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"ping-account.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV] [BALANCE] multichain-node-dev-1.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"multichain-node-dev-1.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"multichain-node-dev-1.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV] [BALANCE] multichain-node-dev-2.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"multichain-node-dev-2.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"multichain-node-dev-2.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV] [BALANCE] multichain-node-dev-3.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"multichain-node-dev-3.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"multichain-node-dev-3.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV] [BALANCE] multichain-node-dev-4.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"multichain-node-dev-4.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"multichain-node-dev-4.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV] [BALANCE] multichain-node-dev-5.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"multichain-node-dev-5.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"multichain-node-dev-5.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV] [BALANCE] multichain-node-dev-6.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"multichain-node-dev-6.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"multichain-node-dev-6.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV] [BALANCE] multichain-node-dev-7.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"multichain-node-dev-7.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"multichain-node-dev-7.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET] [BALANCE]  blacksandtech.near"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.mainnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"blacksandtech.near\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"blacksandtech.near\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "7"
      description      = "Contract Pinger Mainnet account ping-account.near account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET] [BALANCE]  infstones.near"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.mainnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"infstones.near\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"infstones.near\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "7"
      description      = "Contract Pinger Mainnet account ping-account.near account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET] [BALANCE]  lifted-mainnet.near"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.mainnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"lifted-mainnet.near\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"lifted-mainnet.near\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "7"
      description      = "Contract Pinger Mainnet account ping-account.near account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET] [BALANCE]  multichain-mainnet-aurora.near"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.mainnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"multichain-mainnet-aurora.near\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"multichain-mainnet-aurora.near\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "7"
      description      = "Contract Pinger Mainnet account ping-account.near account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET] [BALANCE] near-mpc-staking4all-01.near"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.mainnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"near-mpc-staking4all-01.near\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"near-mpc-staking4all-01.near\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "7"
      description      = "Contract Pinger Mainnet account ping-account.near account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET] [BALANCE]  nodemonster.near"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.mainnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"nodemonster.near\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"nodemonster.near\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "7"
      description      = "Contract Pinger Mainnet account ping-account.near account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET] [BALANCE] mpc-lgns.near"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.mainnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"mpc-lgns.near\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"mpc-lgns.near\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "7"
      description      = "Contract Pinger Mainnet account ping-account.near account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET] [BALANCE] aurora-multichain.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"aurora-multichain.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"aurora-multichain.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET] [BALANCE] bst-near.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"bst-near.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"bst-near.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET] [BALANCE] infstones_nearmpc.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"infstones_nearmpc.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"infstones_nearmpc.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET] [BALANCE] lifted-near.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"lifted-near.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"lifted-near.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET] [BALANCE] mpc-lgns.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"mpc-lgns.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"mpc-lgns.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET] [BALANCE] near-mpc-staking4all-01.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"near-mpc-staking4all-01.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"near-mpc-staking4all-01.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET] [BALANCE] nodemonster.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "b9562554-cb12-4f47-9c39-f18de199d3e5"
      model          = "{\"columns\":[{\"selector\":\"result.amount\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"b9562554-cb12-4f47-9c39-f18de199d3e5\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://rpc.testnet.near.org\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"id\\\": \\\"nodemonster.testnet\\\",\\n  \\\"method\\\": \\\"query\\\",\\n  \\\"params\\\": {\\n    \\\"request_type\\\": \\\"view_account\\\",\\n    \\\"finality\\\": \\\"final\\\",\\n    \\\"account_id\\\": \\\"nodemonster.testnet\\\"\\n  }\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "8"
      description      = "Contract Pinger Testnet account ping-account.testnet account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Near CS"
      group_by      = null
      mute_timings  = null
    }
  }
}
