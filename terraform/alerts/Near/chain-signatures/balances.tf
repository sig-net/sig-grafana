resource "grafana_rule_group" "rule_group_eeaacef7b4929940" {
  # org_id           = 1
  name             = "balances"
  folder_uid       = "multichain"
  interval_seconds = 60
  
  rule {
    name      = "[TESTNET][SOL][BALANCE] Testnet Network Balance"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"result.value\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://solana-devnet.g.alchemy.com/v2/aqA2k3YTA96ODOgOYbmqeaxPUIS-qGpk\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"method\\\": \\\"getBalance\\\",\\n  \\\"params\\\": [\\n    \\\"9LXFa1Tx4fjb69EYNZhMneMaCa4P6UQVN4JPovysLhW5\\\"\\n      ],\\n \\\"id\\\": 1\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "16"
      description      = "Testnet network Solana account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][SOL][BALANCE] Dev Network Balance"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"result.value\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://solana-devnet.g.alchemy.com/v2/aqA2k3YTA96ODOgOYbmqeaxPUIS-qGpk\",\"url_options\":{\"body_content_type\":\"text/plain\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"jsonrpc\\\": \\\"2.0\\\",\\n  \\\"method\\\": \\\"getBalance\\\",\\n  \\\"params\\\": [\\n    \\\"9LXFa1Tx4fjb69EYNZhMneMaCa4P6UQVN4JPovysLhW5\\\"\\n      ],\\n \\\"id\\\": 1\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"source\",\"value\":\"grafana\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "15"
      description      = "Dev network Solana account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][ETH][BALANCE] multichain-node-dev-0.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x7ACa63fdDE2356E85bb98Ceee79BAad1b8955f3A\\\",\\n  \\\"env\\\": \\\"dev\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "14"
      description      = "multichain-node-dev-0.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][ETH][BALANCE] multichain-node-dev-1.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0xea8B9883245d907Be8B81B0792f9C58fF8299090\\\",\\n  \\\"env\\\": \\\"dev\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "17"
      description      = "multichain-node-dev-1.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][ETH][BALANCE] multichain-node-dev-2.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x53370DF3f1F8A9d95133Bc01D272E3c57e20D010\\\",\\n  \\\"env\\\": \\\"dev\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "18"
      description      = "multichain-node-dev-2.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][ETH][BALANCE] multichain-node-dev-3.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x152e6F5A560A68266581A8147aBa8C29F1D9b655\\\",\\n  \\\"env\\\": \\\"dev\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "19"
      description      = "multichain-node-dev-3.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][ETH][BALANCE] multichain-node-dev-4.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0xc36F31bBc1EAd8dfBBB2888120dB9320f8A881F7\\\",\\n  \\\"env\\\": \\\"dev\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "20"
      description      = "multichain-node-dev-4.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][ETH][BALANCE] multichain-node-dev-5.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0xb18ad974b6853092e902dF327171B6D9a2F59D87\\\",\\n  \\\"env\\\": \\\"dev\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "21"
      description      = "multichain-node-dev-5.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][ETH][BALANCE] multichain-node-dev-6.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0xe9535206db309aa5bF85268890c590B485F2EB63\\\",\\n  \\\"env\\\": \\\"dev\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "22"
      description      = "multichain-node-dev-6.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][ETH][BALANCE] multichain-node-dev-7.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x11345F6D810F64ba5649a87EAE43c5EAF8dEfD68\\\",\\n  \\\"env\\\": \\\"dev\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "23"
      description      = "multichain-node-dev-7.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][ETH][BALANCE] multichain-node-dev-8.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0xd3D119096b96C1e4CA791Cd89A52FdE93E25155F\\\",\\n  \\\"env\\\": \\\"dev\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "24"
      description      = "multichain-node-dev-8.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][ETH][BALANCE] multichain-node-dev-9.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x5CD0c5934c9b46D8B84D495c66C0C30Bfa6A6a57\\\",\\n  \\\"env\\\": \\\"dev\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "25"
      description      = "multichain-node-dev-9.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][ETH][BALANCE] multichain-node-dev-10.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0xe38866255987983435C563A2eB4d95877acdd1DE\\\",\\n  \\\"env\\\": \\\"dev\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "26"
      description      = "multichain-node-dev-10.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][ETH][BALANCE] multichain-node-dev-11.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x8CAF5e881b3CB29Da8e36B5D448CbEa34ED2fBf9\\\",\\n  \\\"env\\\": \\\"dev\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "27"
      description      = "multichain-node-dev-11.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET][ETH][BALANCE] multichain-node-testnet-0.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x190c79eFF713Eae2BCcD64DC48eE6080C8C5e178\\\",\\n  \\\"env\\\": \\\"testnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "28"
      description      = "multichain-node-testnet-0.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET][ETH][BALANCE] multichain-node-testnet-1.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x7afDdcF824E319Fa1dA5099dB1c7C8f4eFfC146c\\\",\\n  \\\"env\\\": \\\"testnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "29"
      description      = "multichain-node-testnet-1.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET][ETH][BALANCE] multichain-node-testnet-2.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0xaa4878DfBB72F51Eb519caA96a6a064946e95724\\\",\\n  \\\"env\\\": \\\"testnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "30"
      description      = "multichain-node-testnet-2.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET][ETH][BALANCE] multichain-node-testnet-3.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0xF9b540ab0BEAe02d0a956F325E65545F0E467Cbe\\\",\\n  \\\"env\\\": \\\"testnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "31"
      description      = "multichain-node-testnet-3.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET][ETH][BALANCE] multichain-node-testnet-4.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x21bd2b9c258570d3c371E336973F60a72e25b3E5\\\",\\n  \\\"env\\\": \\\"testnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "32"
      description      = "multichain-node-testnet-4.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET][ETH][BALANCE] multichain-node-testnet-5.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0xc0aEdDBA68eAD5A34B1644196ff1EF000335B26A\\\",\\n  \\\"env\\\": \\\"testnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "33"
      description      = "multichain-node-testnet-5.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET][ETH][BALANCE] multichain-node-testnet-6.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x32B620BeE309e7001d6B6012a20E64001a6eF34E\\\",\\n  \\\"env\\\": \\\"testnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "34"
      description      = "multichain-node-testnet-6.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET][ETH][BALANCE] multichain-node-testnet-7.testnet"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0xe6C4142016937c4e0EbbB025Bf566bf40cFF8ac2\\\",\\n  \\\"env\\\": \\\"testnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "35"
      description      = "multichain-node-testnet-7.testnet ETH account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET][ETH][BALANCE] Sig Node"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0xbf8f3cb37d50353d7f4a0b9bfc5615a492f7f557\\\",\\n  \\\"env\\\": \\\"mainnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.0001],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\",\"unloadEvaluator\":{\"params\":[0.0001],\"type\":\"gt\"}}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "36"
      description      = "Sig Mainnet Node balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET][ETH][BALANCE] Blacksand Node"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0xcc46dcf8c1884bc77ca0b702c5dcfc9a14bd67aa\\\",\\n  \\\"env\\\": \\\"mainnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.0001],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "44"
      description      = "Blacksand account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET][ETH][BALANCE] Stakin"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x0751fbaa7324e74a5fa7775158acb6c2c50a6838\\\",\\n  \\\"env\\\": \\\"mainnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.0001],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "37"
      description      = "Stakin account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET][ETH][BALANCE] Lifted"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x04a028525e4823dc8e592f2916947ce3eca8eff3\\\",\\n  \\\"env\\\": \\\"mainnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.0001],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "40"
      description      = "Lifted account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET][ETH][BALANCE] Taxistake"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0xa7134a9a7ad07f14e85898433611f8782fcfc6c5\\\",\\n  \\\"env\\\": \\\"mainnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.0001],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "38"
      description      = "Taxistake account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET][ETH][BALANCE] Staking4All"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x36307aa360b228139674325e797276aeccc37351\\\",\\n  \\\"env\\\": \\\"mainnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.0001],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "39"
      description      = "Staking4All account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET][ETH][BALANCE] PierTwo"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x0751fbaa7324e74a5fa7775158acb6c2c50a6838\\\",\\n  \\\"env\\\": \\\"mainnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.0001],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "41"
      description      = "PierTwo account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET][ETH][BALANCE] BountyBlok"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x31d22ddafdf238367030f29f9294e24979e258e7\\\",\\n  \\\"env\\\": \\\"mainnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.0001],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A / 1000000000000000000\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "42"
      description      = "BountyBlok account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET][ETH][BALANCE] Luganodes"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "de2db39oo2rk0a"
      model          = "{\"columns\":[{\"selector\":\"balance\",\"text\":\"Amount\",\"type\":\"number\"}],\"computed_columns\":[],\"datasource\":{\"type\":\"yesoreyeram-infinity-datasource\",\"uid\":\"de2db39oo2rk0a\"},\"filterExpression\":\"\",\"filters\":[],\"format\":\"table\",\"global_query_id\":\"\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"parser\":\"backend\",\"refId\":\"A\",\"root_selector\":\"\",\"source\":\"url\",\"summarizeExpression\":\"\",\"type\":\"json\",\"url\":\"https://contract-ping.sig.network/eth_balance\",\"url_options\":{\"body_content_type\":\"Application/json\",\"body_graphql_query\":\"\",\"body_graphql_variables\":\"\",\"body_type\":\"raw\",\"data\":\"{\\n  \\\"address\\\": \\\"0x185636e329e6e9789e3ca0158497e26c07875e1b\\\",\\n  \\\"env\\\": \\\"mainnet\\\"\\n}\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\"},{\"key\":\"x-api-secret\",\"value\":\"default-secret-key\"}],\"method\":\"POST\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.0001],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"A\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    # data {
    #   ref_id = "B"

    #   relative_time_range {
    #     from = 600
    #     to   = 0
    #   }

    #   datasource_uid = "__expr__"
    #   model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"math\"}"
    # }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddtms2vlw0buob"
      __panelId__      = "43"
      description      = "Luganodes account balance is {{ $values.B }}"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
}
