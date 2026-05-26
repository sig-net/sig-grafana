resource "grafana_rule_group" "rule_group_ab5e7f79a1339a71" {
  # org_id           = 1
  name             = "success rates"
  folder_uid       = "multichain"
  interval_seconds = 60

  rule {
    name      = "[MAINNET][SIGNATURES][ETH] Signature SR < 95%"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model = jsonencode({
        datasource = {
          type = "prometheus"
          uid  = "grafanacloud-prom"
        }
        editorMode    = "code"
        expr          = <<-EOT
          (sum(increase(multichain_sign_request_latency_sec_count{environment="mainnet", chain="Ethereum", step="total", status="in_time"}[1h]))
          / (sum(increase(multichain_sign_request_latency_sec_count{environment="mainnet", chain="Ethereum", step="total", status="in_time"}[1h]))
            + (sum(increase(multichain_sign_request_delayed{environment="mainnet", chain="Ethereum"}[1h]))
              or (0 * sum(increase(multichain_sign_request_latency_sec_count{environment="mainnet", chain="Ethereum", step="total", status="in_time"}[1h])))))) * 100
        EOT
        instant       = false
        interval      = ""
        intervalMs    = 60000
        legendFormat  = "1 hour · Ethereum"
        maxDataPoints = 43200
        range         = true
        refId         = "A"
      })
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model = jsonencode({
        conditions = [{
          evaluator = {
            params = []
            type   = "gt"
          }
          operator = {
            type = "and"
          }
          query = {
            params = ["B"]
          }
          reducer = {
            params = []
            type   = "last"
          }
          type = "query"
        }]
        datasource = {
          type = "__expr__"
          uid  = "__expr__"
        }
        expression    = "A"
        intervalMs    = 1000
        maxDataPoints = 43200
        reducer       = "last"
        refId         = "B"
        type          = "reduce"
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
        conditions = [{
          evaluator = {
            params = [95]
            type   = "lt"
          }
          operator = {
            type = "and"
          }
          query = {
            params = ["C"]
          }
          reducer = {
            params = []
            type   = "last"
          }
          type = "query"
        }]
        datasource = {
          type = "__expr__"
          uid  = "__expr__"
        }
        expression    = "B"
        intervalMs    = 1000
        maxDataPoints = 43200
        refId         = "C"
        type          = "threshold"
      })
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "a8258407-c08f-4796-9d3e-31caacde8653"
      __panelId__      = "149"
      description      = "Ethereum 1-hour in-time request SLI has been below 95% for 5 minutes: {{ $values.A }}%"
      summary          = "[MAINNET][SIGNATURES][ETH] Success rate below 95%"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET][SIGNATURES][SOLANA] Signature SR < 95%"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model = jsonencode({
        datasource = {
          type = "prometheus"
          uid  = "grafanacloud-prom"
        }
        editorMode    = "code"
        expr          = <<-EOT
          (sum(increase(multichain_sign_request_latency_sec_count{environment="mainnet", chain="Solana", step="total", status="in_time"}[1h]))
          / (sum(increase(multichain_sign_request_latency_sec_count{environment="mainnet", chain="Solana", step="total", status="in_time"}[1h]))
            + (sum(increase(multichain_sign_request_delayed{environment="mainnet", chain="Solana"}[1h]))
              or (0 * sum(increase(multichain_sign_request_latency_sec_count{environment="mainnet", chain="Solana", step="total", status="in_time"}[1h])))))) * 100
        EOT
        instant       = false
        interval      = ""
        intervalMs    = 60000
        legendFormat  = "1 hour · Solana"
        maxDataPoints = 43200
        range         = true
        refId         = "A"
      })
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model = jsonencode({
        conditions = [{
          evaluator = {
            params = []
            type   = "gt"
          }
          operator = {
            type = "and"
          }
          query = {
            params = ["B"]
          }
          reducer = {
            params = []
            type   = "last"
          }
          type = "query"
        }]
        datasource = {
          type = "__expr__"
          uid  = "__expr__"
        }
        expression    = "A"
        intervalMs    = 1000
        maxDataPoints = 43200
        reducer       = "last"
        refId         = "B"
        type          = "reduce"
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
        conditions = [{
          evaluator = {
            params = [95]
            type   = "lt"
          }
          operator = {
            type = "and"
          }
          query = {
            params = ["C"]
          }
          reducer = {
            params = []
            type   = "last"
          }
          type = "query"
        }]
        datasource = {
          type = "__expr__"
          uid  = "__expr__"
        }
        expression    = "B"
        intervalMs    = 1000
        maxDataPoints = 43200
        refId         = "C"
        type          = "threshold"
      })
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "a8258407-c08f-4796-9d3e-31caacde8653"
      __panelId__      = "149"
      description      = "Solana 1-hour in-time request SLI has been below 95% for 5 minutes: {{ $values.A }}%"
      summary          = "[MAINNET][SIGNATURES][SOLANA] Success rate below 95%"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET][SIGNATURES][HYDRATION] Signature SR < 95%"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model = jsonencode({
        datasource = {
          type = "prometheus"
          uid  = "grafanacloud-prom"
        }
        editorMode    = "code"
        expr          = <<-EOT
          (sum(increase(multichain_sign_request_latency_sec_count{environment="mainnet", chain="Hydration", step="total", status="in_time"}[1h]))
          / (sum(increase(multichain_sign_request_latency_sec_count{environment="mainnet", chain="Hydration", step="total", status="in_time"}[1h]))
            + (sum(increase(multichain_sign_request_delayed{environment="mainnet", chain="Hydration"}[1h]))
              or (0 * sum(increase(multichain_sign_request_latency_sec_count{environment="mainnet", chain="Hydration", step="total", status="in_time"}[1h])))))) * 100
        EOT
        instant       = false
        interval      = ""
        intervalMs    = 60000
        legendFormat  = "1 hour · Hydration"
        maxDataPoints = 43200
        range         = true
        refId         = "A"
      })
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model = jsonencode({
        conditions = [{
          evaluator = {
            params = []
            type   = "gt"
          }
          operator = {
            type = "and"
          }
          query = {
            params = ["B"]
          }
          reducer = {
            params = []
            type   = "last"
          }
          type = "query"
        }]
        datasource = {
          type = "__expr__"
          uid  = "__expr__"
        }
        expression    = "A"
        intervalMs    = 1000
        maxDataPoints = 43200
        reducer       = "last"
        refId         = "B"
        type          = "reduce"
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
        conditions = [{
          evaluator = {
            params = [95]
            type   = "lt"
          }
          operator = {
            type = "and"
          }
          query = {
            params = ["C"]
          }
          reducer = {
            params = []
            type   = "last"
          }
          type = "query"
        }]
        datasource = {
          type = "__expr__"
          uid  = "__expr__"
        }
        expression    = "B"
        intervalMs    = 1000
        maxDataPoints = 43200
        refId         = "C"
        type          = "threshold"
      })
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "a8258407-c08f-4796-9d3e-31caacde8653"
      __panelId__      = "149"
      description      = "Hydration 1-hour in-time request SLI has been below 95% for 5 minutes: {{ $values.A }}%"
      summary          = "[MAINNET][SIGNATURES][HYDRATION] Success rate below 95%"
    }
    is_paused = true

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET][SIGNATURES][SOLANA]Signature Success Rate/Hr"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"adhocFilters\":[],\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"code\",\"exemplar\":false,\"expr\":\" (sum (increase(multichain_sign_requests_success{chain=\\\"Solana\\\",environment=\\\"testnet\\\"}[1h]))/\\n max(increase(multichain_sign_requests_count{chain=\\\"Solana\\\",environment=\\\"testnet\\\"}[1h])))*100\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
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
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[40],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "Alerting"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "a8258407-c08f-4796-9d3e-31caacde8653"
      __panelId__      = "109"
      description      = "Signature success rate has been below 40% for 5 mins: {{ $values.A }}%"
      summary          = "[TESTNET][SIGNATURES][SOLANA] Success rate below 40%"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[TESTNET][SIGNATURES][ETH]Signature Success Rate/Hr"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"adhocFilters\":[],\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"code\",\"exemplar\":false,\"expr\":\" (sum (increase(multichain_sign_requests_success{chain=\\\"Ethereum\\\",environment=\\\"testnet\\\"}[1h]))/\\n max(increase(multichain_sign_requests_count{chain=\\\"Ethereum\\\",environment=\\\"testnet\\\"}[1h])))*100\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
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
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[40],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "Alerting"
    exec_err_state = "Error"
    for            = "15m"
    annotations = {
      __dashboardUid__ = "a8258407-c08f-4796-9d3e-31caacde8653"
      __panelId__      = "108"
      description      = "Signature success rate has been below 40% for 5 mins: {{ $values.A }}%"
      summary          = "[TESTNET][SIGNATURES][ETH] Success rate below 40%"
    }
    is_paused = false

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
      __dashboardUid__ = "a8258407-c08f-4796-9d3e-31caacde8653"
      __panelId__      = "46"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET][PRESIGNATURE] Generator Success Rate < 80%"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 7200
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model = jsonencode({
        datasource = {
          type = "prometheus"
          uid  = "grafanacloud-prom"
        }
        editorMode    = "code"
        expr          = <<-EOT
          sum by(node_account_id) (increase(multichain_num_total_historical_presignature_generators_success{environment="mainnet"}[1h]))
          / sum by(node_account_id) (
              increase(multichain_num_total_historical_presignature_generators_success{environment="mainnet"}[1h])
              + (increase(multichain_presignature_generator_failures{environment="mainnet"}[1h]) or increase(multichain_num_total_historical_presignature_generators_success{environment="mainnet"}[1h]) * 0)
            ) * 100
        EOT
        instant       = false
        interval      = ""
        intervalMs    = 60000
        legendFormat  = "{{node_account_id}}"
        maxDataPoints = 43200
        range         = true
        refId         = "A"
      })
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model = jsonencode({
        conditions = [{
          evaluator = {
            params = []
            type   = "gt"
          }
          operator = {
            type = "and"
          }
          query = {
            params = ["B"]
          }
          reducer = {
            params = []
            type   = "last"
          }
          type = "query"
        }]
        datasource = {
          type = "__expr__"
          uid  = "__expr__"
        }
        expression    = "A"
        intervalMs    = 1000
        maxDataPoints = 43200
        reducer       = "last"
        refId         = "B"
        type          = "reduce"
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
        conditions = [{
          evaluator = {
            params = [80]
            type   = "lt"
          }
          operator = {
            type = "and"
          }
          query = {
            params = ["C"]
          }
          reducer = {
            params = []
            type   = "last"
          }
          type = "query"
        }]
        datasource = {
          type = "__expr__"
          uid  = "__expr__"
        }
        expression    = "B"
        intervalMs    = 1000
        maxDataPoints = 43200
        refId         = "C"
        type          = "threshold"
      })
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1h"
    annotations = {
      __dashboardUid__ = "a8258407-c08f-4796-9d3e-31caacde8653"
      __panelId__      = "120"
      description      = "Presignature generator success rate has been below 80% for more than 1 hour: {{ $values.A }}%"
      summary          = "[MAINNET][PRESIGNATURE] Success rate below 80%"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[MAINNET][TRIPLE] Generator Success Rate < 80%"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 7200
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model = jsonencode({
        datasource = {
          type = "prometheus"
          uid  = "grafanacloud-prom"
        }
        editorMode    = "code"
        expr          = <<-EOT
          sum by(node_account_id) (increase(multichain_num_total_historical_triple_generators_success{environment="mainnet"}[1h]))
          / sum by(node_account_id) (
              increase(multichain_num_total_historical_triple_generators_success{environment="mainnet"}[1h])
              + (increase(multichain_triple_generator_failures{environment="mainnet"}[1h]) or increase(multichain_num_total_historical_triple_generators_success{environment="mainnet"}[1h]) * 0)
            ) * 100
        EOT
        instant       = false
        interval      = ""
        intervalMs    = 60000
        legendFormat  = "{{node_account_id}}"
        maxDataPoints = 43200
        range         = true
        refId         = "A"
      })
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model = jsonencode({
        conditions = [{
          evaluator = {
            params = []
            type   = "gt"
          }
          operator = {
            type = "and"
          }
          query = {
            params = ["B"]
          }
          reducer = {
            params = []
            type   = "last"
          }
          type = "query"
        }]
        datasource = {
          type = "__expr__"
          uid  = "__expr__"
        }
        expression    = "A"
        intervalMs    = 1000
        maxDataPoints = 43200
        reducer       = "last"
        refId         = "B"
        type          = "reduce"
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
        conditions = [{
          evaluator = {
            params = [80]
            type   = "lt"
          }
          operator = {
            type = "and"
          }
          query = {
            params = ["C"]
          }
          reducer = {
            params = []
            type   = "last"
          }
          type = "query"
        }]
        datasource = {
          type = "__expr__"
          uid  = "__expr__"
        }
        expression    = "B"
        intervalMs    = 1000
        maxDataPoints = 43200
        refId         = "C"
        type          = "threshold"
      })
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1h"
    annotations = {
      __dashboardUid__ = "a8258407-c08f-4796-9d3e-31caacde8653"
      __panelId__      = "119"
      description      = "Triple generator success rate has been below 80% for more than 1 hour: {{ $values.A }}%"
      summary          = "[MAINNET][TRIPLE] Success rate below 80%"
    }
    is_paused = false

    notification_settings {
      contact_point = "MPC Alerts"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][SIGNATURES][Solana]Signature Success Rate/Hr"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"adhocFilters\":[],\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"code\",\"exemplar\":false,\"expr\":\" (sum (increase(multichain_sign_requests_success{chain=\\\"Solana\\\",environment=\\\"dev\\\"}[1h]))/\\n max(increase(multichain_sign_requests_count{chain=\\\"Solana\\\",environment=\\\"dev\\\"}[1h])))*100\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
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

    no_data_state  = "Alerting"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "a8258407-c08f-4796-9d3e-31caacde8653"
      __panelId__      = "109"
      description      = "Signature success rate has been below 50% for 5 mins: {{ $values.A }}%"
      summary          = "[DEV][SIGNATURES][SOLANA] Success rate below 50%"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][SIGNATURES][ETH]Signature Success Rate/Hr"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"adhocFilters\":[],\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"code\",\"exemplar\":false,\"expr\":\" (sum (increase(multichain_sign_requests_success{chain=\\\"Ethereum\\\",environment=\\\"dev\\\"}[1h]))/\\n max(increase(multichain_sign_requests_count{chain=\\\"Ethereum\\\",environment=\\\"dev\\\"}[1h])))*100\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
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

    no_data_state  = "Alerting"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "a8258407-c08f-4796-9d3e-31caacde8653"
      __panelId__      = "108"
      description      = "Signature success rate has been below 50% for 5 mins: {{ $values.A }}%"
      summary          = "[DEV][SIGNATURES][ETH] Success rate below 50%"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
}
