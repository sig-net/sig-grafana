resource "grafana_rule_group" "rule_group_d2d0b898365eeb0c" {
  # org_id           = 1
  name             = "hardware metrics"
  folder_uid       = "multichain"
  interval_seconds = 60

  rule {
    name      = "[DEV][HARDWARE]CPU Usage Percentage High"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"adhocFilters\":[],\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"builder\",\"expr\":\"multichain_cpu_usage_percentage{node_account_id=~\\\"(multichain-node-dev-0\\\\\\\\.testnet|multichain-node-dev-1\\\\\\\\.testnet|multichain-node-dev-10\\\\\\\\.testnet|multichain-node-dev-11\\\\\\\\.testnet|multichain-node-dev-2\\\\\\\\.testnet|multichain-node-dev-3\\\\\\\\.testnet|multichain-node-dev-4\\\\\\\\.testnet|multichain-node-dev-5\\\\\\\\.testnet|multichain-node-dev-6\\\\\\\\.testnet|multichain-node-dev-7\\\\\\\\.testnet|multichain-node-dev-8\\\\\\\\.testnet|multichain-node-dev-9\\\\\\\\.testnet)\\\"}\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
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
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[90],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "69"
      description      = "CPU usage percentage has been at or above 90% for more than 5 mins: {{ $values.A }}%"
      summary          = "[DEV][HARDWARE] Node CPU usage 90% or above"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][HARDWARE]Available Disk Space Below 20%"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"adhocFilters\":[],\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"builder\",\"expr\":\"multichain_available_disk_space_bytes{node_account_id=~\\\"(multichain-node-dev-0\\\\\\\\.testnet|multichain-node-dev-1\\\\\\\\.testnet|multichain-node-dev-10\\\\\\\\.testnet|multichain-node-dev-11\\\\\\\\.testnet|multichain-node-dev-2\\\\\\\\.testnet|multichain-node-dev-3\\\\\\\\.testnet|multichain-node-dev-4\\\\\\\\.testnet|multichain-node-dev-5\\\\\\\\.testnet|multichain-node-dev-6\\\\\\\\.testnet|multichain-node-dev-7\\\\\\\\.testnet|multichain-node-dev-8\\\\\\\\.testnet|multichain-node-dev-9\\\\\\\\.testnet)\\\"} / 1000000000\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[20],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"min\",\"refId\":\"B\",\"settings\":{\"mode\":\"\"},\"type\":\"reduce\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "2h"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "68"
      description      = "Root disk space is below 20%: {{ $values.A }} GB remaining"
      summary          = "[DEV][HARDWARE]Available Disk Space Below 20%"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "[DEV][HARDWARE]Available Memory in GB"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"adhocFilters\":[],\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"disableTextWrap\":false,\"editorMode\":\"builder\",\"expr\":\"multichain_available_memory_bytes{node_account_id=~\\\"(multichain-node-dev-0\\\\\\\\.testnet|multichain-node-dev-1\\\\\\\\.testnet|multichain-node-dev-10\\\\\\\\.testnet|multichain-node-dev-11\\\\\\\\.testnet|multichain-node-dev-2\\\\\\\\.testnet|multichain-node-dev-3\\\\\\\\.testnet|multichain-node-dev-4\\\\\\\\.testnet|multichain-node-dev-5\\\\\\\\.testnet|multichain-node-dev-6\\\\\\\\.testnet|multichain-node-dev-7\\\\\\\\.testnet|multichain-node-dev-8\\\\\\\\.testnet|multichain-node-dev-9\\\\\\\\.testnet)\\\"} / 1000000000\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"instant\":false,\"interval\":\"\",\"intervalMs\":60000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\",\"useBackend\":false}"
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
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "bdg2srektjy0wd"
      __panelId__      = "67"
      description      = "Node has abnormally high memory usage: {{ $values.A }} GB remaining"
      summary          = "[DEV][HARDWARE]Node memory usage high"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
}
