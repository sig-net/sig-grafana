locals {
  chain_signatures_prod_dashboard_uid = "a8258407-c08f-4796-9d3e-31caacde8653"

  chain_signatures_contacts = {
    business = "Business Critical"
    dev      = "Multichain Dev"
    mpc      = "MPC Alerts"
    sre      = "SRE On-call"
  }

  # TODO: replace this temporary route with a dedicated Business Critical destination for David.
  business_critical_rules = [
    {
      name          = "[MAINNET][BUSINESS CRITICAL] In-time Requests SLI 30d below 95%"
      expr          = "(((((sum(increase(multichain_sign_request_latency_sec_count{environment=\"mainnet\", step=\"total\", status=\"in_time\"}[30d])) or vector(0)) + (sum(increase(multichain_sign_request_delayed{environment=\"mainnet\"}[30d])) or vector(0))) > bool 0) * ((((sum(increase(multichain_sign_request_latency_sec_count{environment=\"mainnet\", step=\"total\", status=\"in_time\"}[30d])) or vector(0)) / clamp_min((((sum(increase(multichain_sign_request_latency_sec_count{environment=\"mainnet\", step=\"total\", status=\"in_time\"}[30d])) or vector(0)) + (sum(increase(multichain_sign_request_delayed{environment=\"mainnet\"}[30d])) or vector(0))), 1)) * 100))) + (((((sum(increase(multichain_sign_request_latency_sec_count{environment=\"mainnet\", step=\"total\", status=\"in_time\"}[30d])) or vector(0)) + (sum(increase(multichain_sign_request_delayed{environment=\"mainnet\"}[30d])) or vector(0))) == bool 0) * 100))"
      threshold     = 95
      comparator    = "lt"
      panel_id      = "148"
      contact_point = local.chain_signatures_contacts.business
      for           = "1h"
      legend_format = "30 DAYS"
      query_type    = "instant"
      range         = false
      instant       = true
      no_data_state = "OK"
      summary       = "[MAINNET][BUSINESS CRITICAL] In-time requests SLI (30d) below 95%"
      description   = "Mainnet in-time requests SLI (30d) is below 95%: {{ $values.B }}"
    },
    {
      name          = "[TESTNET][BUSINESS CRITICAL] In-time Requests SLI 30d below 95%"
      expr          = "(sum(increase(multichain_sign_request_latency_sec_count{environment=\"testnet\", step=\"total\", status=\"in_time\"}[30d])) / (sum(increase(multichain_sign_request_latency_sec_count{environment=\"testnet\", step=\"total\", status=\"in_time\"}[30d])) + (sum(increase(multichain_sign_request_delayed{environment=\"testnet\"}[30d])) or vector(0)))) * 100"
      threshold     = 95
      comparator    = "lt"
      panel_id      = "148"
      contact_point = local.chain_signatures_contacts.business
      for           = "1h"
      legend_format = "30 DAYS"
      query_type    = "instant"
      range         = false
      instant       = true
      no_data_state = "NoData"
      summary       = "[TESTNET][BUSINESS CRITICAL] In-time requests SLI (30d) below 95%"
      description   = "Testnet in-time requests SLI (30d) is below 95%: {{ $values.B }}"
    },
  ]

  chain_signatures_prod_sre_rules = [
    {
      name          = "[DEV][HARDWARE] Max CPU Usage above 80%"
      expr          = "max by(node_account_id) (multichain_cpu_usage_percentage{environment=\"dev\"})"
      threshold     = 80
      comparator    = "gt"
      panel_id      = "154"
      contact_point = local.chain_signatures_contacts.dev
      for           = "1h"
      legend_format = "__auto"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "NoData"
      summary       = "[DEV][HARDWARE] Max CPU usage above 80%"
      description   = "Dev node CPU usage is above 80% for {{ $labels.node_account_id }}: {{ $values.B }}%"
    },
    {
      name          = "[TESTNET][HARDWARE] Max CPU Usage above 80%"
      expr          = "max by(node_account_id) (multichain_cpu_usage_percentage{environment=\"testnet\"})"
      threshold     = 80
      comparator    = "gt"
      panel_id      = "154"
      contact_point = local.chain_signatures_contacts.sre
      for           = "1h"
      legend_format = "__auto"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "NoData"
      summary       = "[TESTNET][HARDWARE] Max CPU usage above 80%"
      description   = "Testnet node CPU usage is above 80% for {{ $labels.node_account_id }}: {{ $values.B }}%"
    },
    {
      name          = "[MAINNET][HARDWARE] Max CPU Usage above 80%"
      expr          = "max by(node_account_id) (multichain_cpu_usage_percentage{environment=\"mainnet\"})"
      threshold     = 80
      comparator    = "gt"
      panel_id      = "154"
      contact_point = local.chain_signatures_contacts.sre
      for           = "1h"
      legend_format = "__auto"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "OK"
      summary       = "[MAINNET][HARDWARE] Max CPU usage above 80%"
      description   = "Mainnet node CPU usage is above 80% for {{ $labels.node_account_id }}: {{ $values.B }}%"
    },
    {
      name          = "[DEV][HARDWARE] Min Available RAM below 4GiB"
      expr          = "min by(node_account_id) (multichain_available_memory_bytes{environment=\"dev\"})"
      threshold     = 4294967296
      comparator    = "lt"
      panel_id      = "155"
      contact_point = local.chain_signatures_contacts.dev
      for           = "1h"
      legend_format = "__auto"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "NoData"
      summary       = "[DEV][HARDWARE] Min available RAM below 4GiB"
      description   = "Dev node available RAM is below 4GiB for {{ $labels.node_account_id }}: {{ $values.B }} bytes"
    },
    {
      name          = "[TESTNET][HARDWARE] Min Available RAM below 4GiB"
      expr          = "min by(node_account_id) (multichain_available_memory_bytes{environment=\"testnet\"})"
      threshold     = 4294967296
      comparator    = "lt"
      panel_id      = "155"
      contact_point = local.chain_signatures_contacts.sre
      for           = "1h"
      legend_format = "__auto"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "NoData"
      summary       = "[TESTNET][HARDWARE] Min available RAM below 4GiB"
      description   = "Testnet node available RAM is below 4GiB for {{ $labels.node_account_id }}: {{ $values.B }} bytes"
    },
    {
      name          = "[MAINNET][HARDWARE] Min Available RAM below 4GiB"
      expr          = "min by(node_account_id) (multichain_available_memory_bytes{environment=\"mainnet\"})"
      threshold     = 4294967296
      comparator    = "lt"
      panel_id      = "155"
      contact_point = local.chain_signatures_contacts.sre
      for           = "1h"
      legend_format = "__auto"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "OK"
      summary       = "[MAINNET][HARDWARE] Min available RAM below 4GiB"
      description   = "Mainnet node available RAM is below 4GiB for {{ $labels.node_account_id }}: {{ $values.B }} bytes"
    },
    {
      name          = "[DEV][HARDWARE] Min Available Disk below 20GiB"
      expr          = "min by(node_account_id) (multichain_available_disk_space_bytes{environment=\"dev\"})"
      threshold     = 21474836480
      comparator    = "lt"
      panel_id      = "156"
      contact_point = local.chain_signatures_contacts.dev
      for           = "1h"
      legend_format = "__auto"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "NoData"
      summary       = "[DEV][HARDWARE] Min available disk below 20GiB"
      description   = "Dev node available disk is below 20GiB for {{ $labels.node_account_id }}: {{ $values.B }} bytes"
    },
    {
      name          = "[TESTNET][HARDWARE] Min Available Disk below 20GiB"
      expr          = "min by(node_account_id) (multichain_available_disk_space_bytes{environment=\"testnet\"})"
      threshold     = 21474836480
      comparator    = "lt"
      panel_id      = "156"
      contact_point = local.chain_signatures_contacts.sre
      for           = "1h"
      legend_format = "__auto"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "NoData"
      summary       = "[TESTNET][HARDWARE] Min available disk below 20GiB"
      description   = "Testnet node available disk is below 20GiB for {{ $labels.node_account_id }}: {{ $values.B }} bytes"
    },
    {
      name          = "[MAINNET][HARDWARE] Min Available Disk below 20GiB"
      expr          = "min by(node_account_id) (multichain_available_disk_space_bytes{environment=\"mainnet\"})"
      threshold     = 21474836480
      comparator    = "lt"
      panel_id      = "156"
      contact_point = local.chain_signatures_contacts.sre
      for           = "1h"
      legend_format = "__auto"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "OK"
      summary       = "[MAINNET][HARDWARE] Min available disk below 20GiB"
      description   = "Mainnet node available disk is below 20GiB for {{ $labels.node_account_id }}: {{ $values.B }} bytes"
    },
    {
      name          = "[DEV][NETWORK] Is the node running?"
      expr          = "max by(node_account_id) (multichain_node_is_up{environment=\"dev\"})"
      threshold     = 1
      comparator    = "lt"
      panel_id      = "1"
      contact_point = local.chain_signatures_contacts.dev
      for           = "5m"
      legend_format = "__auto"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "Alerting"
      summary       = "[DEV][NETWORK] Node is down"
      description   = "Dev node is not running for {{ $labels.node_account_id }}"
    },
    {
      name          = "[TESTNET][NETWORK] Is the node running?"
      expr          = "max by(node_account_id) (multichain_node_is_up{environment=\"testnet\"})"
      threshold     = 1
      comparator    = "lt"
      panel_id      = "1"
      contact_point = local.chain_signatures_contacts.sre
      for           = "5m"
      legend_format = "__auto"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "NoData"
      summary       = "[TESTNET][NETWORK] Node is down"
      description   = "Testnet node is not running for {{ $labels.node_account_id }}"
    },
    {
      name          = "[MAINNET][NETWORK] Is the node running?"
      expr          = "max by(node_account_id) (multichain_node_is_up{environment=\"mainnet\"})"
      threshold     = 1
      comparator    = "lt"
      panel_id      = "1"
      contact_point = local.chain_signatures_contacts.sre
      for           = "5m"
      legend_format = "__auto"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "OK"
      summary       = "[MAINNET][NETWORK] Node is down"
      description   = "Mainnet node is not running for {{ $labels.node_account_id }}"
    },
    {
      name          = "[DEV][NETWORK][ETH] Latest Block Height Stalled"
      expr          = "max by(node_account_id) (rate(multichain_latest_block_number{environment=\"dev\", chain=\"Ethereum\", status=\"indexed\"}[1m]))"
      threshold     = 0.001
      comparator    = "lt"
      panel_id      = "81"
      contact_point = local.chain_signatures_contacts.dev
      for           = "5m"
      legend_format = "{{node_account_id}}"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "NoData"
      summary       = "[DEV][NETWORK][ETH] Latest block height stalled"
      description   = "Dev Ethereum indexed block height has not advanced for {{ $labels.node_account_id }}: {{ $values.B }}"
    },
    {
      name          = "[DEV][NETWORK][SOLANA] Latest Block Height Stalled"
      expr          = "max by(node_account_id) (rate(multichain_latest_block_number{environment=\"dev\", chain=\"Solana\", status=\"finalized\"}[1m]))"
      threshold     = 0.001
      comparator    = "lt"
      panel_id      = "140"
      contact_point = local.chain_signatures_contacts.dev
      for           = "5m"
      legend_format = "{{node_account_id}}"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "NoData"
      summary       = "[DEV][NETWORK][SOLANA] Latest block height stalled"
      description   = "Dev Solana finalized block height has not advanced for {{ $labels.node_account_id }}: {{ $values.B }}"
    },
    {
      name          = "[DEV][NETWORK][HYDRATION] Latest Block Height Stalled"
      expr          = "max by(node_account_id) (rate(multichain_latest_block_number{environment=\"dev\", chain=\"Hydration\", status=\"indexed\"}[1m]))"
      threshold     = 0.001
      comparator    = "lt"
      panel_id      = "157"
      contact_point = local.chain_signatures_contacts.dev
      for           = "5m"
      legend_format = "{{node_account_id}}"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "NoData"
      summary       = "[DEV][NETWORK][HYDRATION] Latest block height stalled"
      description   = "Dev Hydration indexed block height has not advanced for {{ $labels.node_account_id }}: {{ $values.B }}"
    },
    {
      name          = "[TESTNET][NETWORK][ETH] Latest Block Height Stalled"
      expr          = "max by(node_account_id) (rate(multichain_latest_block_number{environment=\"testnet\", chain=\"Ethereum\", status=\"indexed\"}[1m]))"
      threshold     = 0.001
      comparator    = "lt"
      panel_id      = "81"
      contact_point = local.chain_signatures_contacts.sre
      for           = "5m"
      legend_format = "{{node_account_id}}"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "NoData"
      summary       = "[TESTNET][NETWORK][ETH] Latest block height stalled"
      description   = "Testnet Ethereum indexed block height has not advanced for {{ $labels.node_account_id }}: {{ $values.B }}"
    },
    {
      name          = "[TESTNET][NETWORK][SOLANA] Latest Block Height Stalled"
      expr          = "max by(node_account_id) (rate(multichain_latest_block_number{environment=\"testnet\", chain=\"Solana\", status=\"finalized\"}[1m]))"
      threshold     = 0.001
      comparator    = "lt"
      panel_id      = "140"
      contact_point = local.chain_signatures_contacts.sre
      for           = "5m"
      legend_format = "{{node_account_id}}"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "NoData"
      summary       = "[TESTNET][NETWORK][SOLANA] Latest block height stalled"
      description   = "Testnet Solana finalized block height has not advanced for {{ $labels.node_account_id }}: {{ $values.B }}"
    },
    {
      name          = "[TESTNET][NETWORK][HYDRATION] Latest Block Height Stalled"
      expr          = "max by(node_account_id) (rate(multichain_latest_block_number{environment=\"testnet\", chain=\"Hydration\", status=\"indexed\"}[1m]))"
      threshold     = 0.001
      comparator    = "lt"
      panel_id      = "157"
      contact_point = local.chain_signatures_contacts.sre
      for           = "5m"
      legend_format = "{{node_account_id}}"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "NoData"
      summary       = "[TESTNET][NETWORK][HYDRATION] Latest block height stalled"
      description   = "Testnet Hydration indexed block height has not advanced for {{ $labels.node_account_id }}: {{ $values.B }}"
    },
    {
      name          = "[MAINNET][NETWORK][ETH] Latest Block Height Stalled"
      expr          = "max by(node_account_id) (rate(multichain_latest_block_number{environment=\"mainnet\", chain=\"Ethereum\", status=\"indexed\"}[1m]))"
      threshold     = 0.001
      comparator    = "lt"
      panel_id      = "81"
      contact_point = local.chain_signatures_contacts.sre
      for           = "5m"
      legend_format = "{{node_account_id}}"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "OK"
      summary       = "[MAINNET][NETWORK][ETH] Latest block height stalled"
      description   = "Mainnet Ethereum indexed block height has not advanced for {{ $labels.node_account_id }}: {{ $values.B }}"
    },
    {
      name          = "[MAINNET][NETWORK][SOLANA] Latest Block Height Stalled"
      expr          = "max by(node_account_id) (rate(multichain_latest_block_number{environment=\"mainnet\", chain=\"Solana\", status=\"finalized\"}[1m]))"
      threshold     = 0.001
      comparator    = "lt"
      panel_id      = "140"
      contact_point = local.chain_signatures_contacts.sre
      for           = "5m"
      legend_format = "{{node_account_id}}"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "OK"
      summary       = "[MAINNET][NETWORK][SOLANA] Latest block height stalled"
      description   = "Mainnet Solana finalized block height has not advanced for {{ $labels.node_account_id }}: {{ $values.B }}"
    },
    {
      name          = "[MAINNET][NETWORK][HYDRATION] Latest Block Height Stalled"
      expr          = "max by(node_account_id) (rate(multichain_latest_block_number{environment=\"mainnet\", chain=\"Hydration\", status=\"indexed\"}[1m]))"
      threshold     = 0.001
      comparator    = "lt"
      panel_id      = "157"
      contact_point = local.chain_signatures_contacts.sre
      for           = "5m"
      legend_format = "{{node_account_id}}"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "OK"
      summary       = "[MAINNET][NETWORK][HYDRATION] Latest block height stalled"
      description   = "Mainnet Hydration indexed block height has not advanced for {{ $labels.node_account_id }}: {{ $values.B }}"
    },
  ]

  chain_signatures_prod_mpc_rules = [
    {
      name          = "[TESTNET][MPC] In-time Requests SLI Trend below 95%"
      expr          = "(sum by(chain) (increase(multichain_sign_request_latency_sec_count{environment=\"testnet\", step=\"total\", status=\"in_time\"}[1h])) / (sum by(chain) (increase(multichain_sign_request_latency_sec_count{environment=\"testnet\", step=\"total\", status=\"in_time\"}[1h])) + (sum by(chain) (increase(multichain_sign_request_delayed{environment=\"testnet\"}[1h])) or (0 * sum by(chain) (increase(multichain_sign_request_latency_sec_count{environment=\"testnet\", step=\"total\", status=\"in_time\"}[1h])))))) * 100"
      threshold     = 95
      comparator    = "lt"
      panel_id      = "149"
      contact_point = local.chain_signatures_contacts.mpc
      for           = "1h"
      legend_format = "{{chain}}"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "NoData"
      summary       = "[TESTNET][MPC] In-time requests SLI trend below 95%"
      description   = "Testnet in-time requests SLI trend is below 95% for {{ $labels.chain }}: {{ $values.B }}%"
    },
    {
      name          = "[MAINNET][MPC] In-time Requests SLI Trend below 95%"
      expr          = "(((((sum by(chain) (increase(multichain_sign_request_latency_sec_count{environment=\"mainnet\", step=\"total\", status=\"in_time\"}[1h])) or vector(0)) + (sum by(chain) (increase(multichain_sign_request_delayed{environment=\"mainnet\"}[1h])) or vector(0))) > bool 0) * ((((sum by(chain) (increase(multichain_sign_request_latency_sec_count{environment=\"mainnet\", step=\"total\", status=\"in_time\"}[1h])) or vector(0)) / clamp_min((((sum by(chain) (increase(multichain_sign_request_latency_sec_count{environment=\"mainnet\", step=\"total\", status=\"in_time\"}[1h])) or vector(0)) + (sum by(chain) (increase(multichain_sign_request_delayed{environment=\"mainnet\"}[1h])) or vector(0))), 1)) * 100))) + (((((sum by(chain) (increase(multichain_sign_request_latency_sec_count{environment=\"mainnet\", step=\"total\", status=\"in_time\"}[1h])) or vector(0)) + (sum by(chain) (increase(multichain_sign_request_delayed{environment=\"mainnet\"}[1h])) or vector(0))) == bool 0) * 100))"
      threshold     = 95
      comparator    = "lt"
      panel_id      = "149"
      contact_point = local.chain_signatures_contacts.mpc
      for           = "1h"
      legend_format = "{{chain}}"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "OK"
      summary       = "[MAINNET][MPC] In-time requests SLI trend below 95%"
      description   = "Mainnet in-time requests SLI trend is below 95% for {{ $labels.chain }}: {{ $values.B }}%"
    },
    {
      name          = "[TESTNET][MPC] Backlog Size above 200"
      expr          = "max by(node_account_id) (multichain_backlog_size{environment=\"testnet\"})"
      threshold     = 200
      comparator    = "gt"
      panel_id      = "144"
      contact_point = local.chain_signatures_contacts.mpc
      for           = "1h"
      legend_format = "__auto"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "NoData"
      summary       = "[TESTNET][MPC] Backlog size above 200"
      description   = "Testnet backlog size is above 200 for {{ $labels.node_account_id }}: {{ $values.B }}"
    },
    {
      name          = "[MAINNET][MPC] Backlog Size above 200"
      expr          = "max by(node_account_id) (multichain_backlog_size{environment=\"mainnet\"})"
      threshold     = 200
      comparator    = "gt"
      panel_id      = "144"
      contact_point = local.chain_signatures_contacts.mpc
      for           = "1h"
      legend_format = "__auto"
      query_type    = "range"
      range         = true
      instant       = false
      no_data_state = "OK"
      summary       = "[MAINNET][MPC] Backlog size above 200"
      description   = "Mainnet backlog size is above 200 for {{ $labels.node_account_id }}: {{ $values.B }}"
    },
  ]
}

resource "grafana_contact_point" "contact_point_chain_signatures_business_critical" {
  name = local.chain_signatures_contacts.business

  oncall {
    url         = data.google_secret_manager_secret_version.mpc_alerts_url.secret_data
    http_method = "POST"
  }
}

resource "grafana_rule_group" "chain_signatures_prod_business_critical" {
  name             = "chain signatures prod business critical"
  folder_uid       = "multichain"
  interval_seconds = 60

  dynamic "rule" {
    for_each = local.business_critical_rules
    content {
      name      = rule.value.name
      condition = "C"

      data {
        ref_id = "A"

        relative_time_range {
          from = 3600
          to   = 0
        }

        datasource_uid = "grafanacloud-prom"
        model = jsonencode({
          datasource    = { type = "prometheus", uid = "grafanacloud-prom" }
          editorMode    = "code"
          expr          = rule.value.expr
          instant       = rule.value.instant
          legendFormat  = rule.value.legend_format
          queryType     = rule.value.query_type
          range         = rule.value.range
          intervalMs    = 60000
          maxDataPoints = 43200
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
            evaluator = { params = [], type = "gt" }
            operator  = { type = "and" }
            query     = { params = ["B"] }
            reducer   = { params = [], type = "last" }
            type      = "query"
          }]
          datasource    = { type = "__expr__", uid = "__expr__" }
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
            evaluator = { params = [rule.value.threshold], type = rule.value.comparator }
            operator  = { type = "and" }
            query     = { params = ["C"] }
            reducer   = { params = [], type = "last" }
            type      = "query"
          }]
          datasource    = { type = "__expr__", uid = "__expr__" }
          expression    = "B"
          intervalMs    = 1000
          maxDataPoints = 43200
          refId         = "C"
          type          = "threshold"
        })
      }

      no_data_state  = rule.value.no_data_state
      exec_err_state = "Error"
      for            = rule.value.for
      annotations = {
        __dashboardUid__ = local.chain_signatures_prod_dashboard_uid
        __panelId__      = rule.value.panel_id
        description      = rule.value.description
        summary          = rule.value.summary
      }
      is_paused = false

      notification_settings {
        contact_point = rule.value.contact_point
        group_by      = null
        mute_timings  = null
      }
    }
  }
}

resource "grafana_rule_group" "chain_signatures_prod_sre" {
  name             = "chain signatures prod sre"
  folder_uid       = "multichain"
  interval_seconds = 60

  dynamic "rule" {
    for_each = local.chain_signatures_prod_sre_rules
    content {
      name      = rule.value.name
      condition = "C"

      data {
        ref_id = "A"

        relative_time_range {
          from = 3600
          to   = 0
        }

        datasource_uid = "grafanacloud-prom"
        model = jsonencode({
          datasource    = { type = "prometheus", uid = "grafanacloud-prom" }
          editorMode    = "code"
          expr          = rule.value.expr
          instant       = rule.value.instant
          legendFormat  = rule.value.legend_format
          queryType     = rule.value.query_type
          range         = rule.value.range
          intervalMs    = 60000
          maxDataPoints = 43200
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
            evaluator = { params = [], type = "gt" }
            operator  = { type = "and" }
            query     = { params = ["B"] }
            reducer   = { params = [], type = "last" }
            type      = "query"
          }]
          datasource    = { type = "__expr__", uid = "__expr__" }
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
            evaluator = { params = [rule.value.threshold], type = rule.value.comparator }
            operator  = { type = "and" }
            query     = { params = ["C"] }
            reducer   = { params = [], type = "last" }
            type      = "query"
          }]
          datasource    = { type = "__expr__", uid = "__expr__" }
          expression    = "B"
          intervalMs    = 1000
          maxDataPoints = 43200
          refId         = "C"
          type          = "threshold"
        })
      }

      no_data_state  = rule.value.no_data_state
      exec_err_state = "Error"
      for            = rule.value.for
      annotations = {
        __dashboardUid__ = local.chain_signatures_prod_dashboard_uid
        __panelId__      = rule.value.panel_id
        description      = rule.value.description
        summary          = rule.value.summary
      }
      is_paused = false

      notification_settings {
        contact_point = rule.value.contact_point
        group_by      = null
        mute_timings  = null
      }
    }
  }
}

resource "grafana_rule_group" "chain_signatures_prod_mpc" {
  name             = "chain signatures prod mpc"
  folder_uid       = "multichain"
  interval_seconds = 60

  dynamic "rule" {
    for_each = local.chain_signatures_prod_mpc_rules
    content {
      name      = rule.value.name
      condition = "C"

      data {
        ref_id = "A"

        relative_time_range {
          from = 3600
          to   = 0
        }

        datasource_uid = "grafanacloud-prom"
        model = jsonencode({
          datasource    = { type = "prometheus", uid = "grafanacloud-prom" }
          editorMode    = "code"
          expr          = rule.value.expr
          instant       = rule.value.instant
          legendFormat  = rule.value.legend_format
          queryType     = rule.value.query_type
          range         = rule.value.range
          intervalMs    = 60000
          maxDataPoints = 43200
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
            evaluator = { params = [], type = "gt" }
            operator  = { type = "and" }
            query     = { params = ["B"] }
            reducer   = { params = [], type = "last" }
            type      = "query"
          }]
          datasource    = { type = "__expr__", uid = "__expr__" }
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
            evaluator = { params = [rule.value.threshold], type = rule.value.comparator }
            operator  = { type = "and" }
            query     = { params = ["C"] }
            reducer   = { params = [], type = "last" }
            type      = "query"
          }]
          datasource    = { type = "__expr__", uid = "__expr__" }
          expression    = "B"
          intervalMs    = 1000
          maxDataPoints = 43200
          refId         = "C"
          type          = "threshold"
        })
      }

      no_data_state  = rule.value.no_data_state
      exec_err_state = "Error"
      for            = rule.value.for
      annotations = {
        __dashboardUid__ = local.chain_signatures_prod_dashboard_uid
        __panelId__      = rule.value.panel_id
        description      = rule.value.description
        summary          = rule.value.summary
      }
      is_paused = false

      notification_settings {
        contact_point = rule.value.contact_point
        group_by      = null
        mute_timings  = null
      }
    }
  }
}
