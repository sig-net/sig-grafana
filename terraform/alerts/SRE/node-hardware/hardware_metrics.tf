resource "grafana_rule_group" "sre_node_hardware" {
  org_id           = 1
  name             = "CPU Usage"
  folder_uid       = "befk4ud4xv5s0d"
  interval_seconds = 60

  rule {
    name      = "Multichain Mainnet Node CPU usage"
    condition = "G"

    data {
      ref_id     = "A"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "aefk7aww1brb4c"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"aefk7aww1brb4c\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-mainnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"mainnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-mainnet-0\\\"}[1s]))\",\"projectName\":\"near-cs-mainnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"A\",\"timeSeriesList\":{\"alignmentPeriod\":\"cloud-monitoring-auto\",\"crossSeriesReducer\":\"REDUCE_NONE\",\"filters\":[\"metric.type\",\"=\",\"kubernetes.io/anthos/APIServiceOpenAPIAggregationControllerQueue1_longest_running_processor_microseconds\"],\"groupBys\":[],\"perSeriesAligner\":\"ALIGN_NONE\",\"preprocessor\":\"none\",\"projectName\":\"near-cs-mainnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "B"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "aefk7aww1brb4c"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"aefk7aww1brb4c\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_cpu_limit_cores{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-mainnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"mainnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-mainnet-0\\\"}[3h]))\",\"projectName\":\"near-cs-mainnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"B\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-mainnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"C\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "D"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"D\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"C\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"D\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "E"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"E\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "F"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$${C}/$${E} > 0.8\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"F\",\"type\":\"math\"}"
    }
    data {
      ref_id = "G"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\",\"unloadEvaluator\":{\"params\":[0,0],\"type\":\"lt\"}}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"F\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"G\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1h"
    annotations = {
      __dashboardUid__ = "defk916x2e0hsd"
      __panelId__      = "1"
      description      = "Check CPU usage of mainnet node, reduce limit if an error, or scale accordingly"
      summary          = "[MAINNET] CPU USAGE HIGH FOR 1H"
    }
    is_paused = false

    notification_settings {
      contact_point = "SRE On-call"
    }
  }
  rule {
    name      = "Mainnet Node Memory"
    condition = "D"

    data {
      ref_id     = "A"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "aefk7aww1brb4c"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"aefk7aww1brb4c\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-mainnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"mainnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-mainnet-0\\\"}[30m]))\",\"projectName\":\"near-cs-mainnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"A\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-mainnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "B"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "aefk7aww1brb4c"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"aefk7aww1brb4c\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_limit_bytes{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-mainnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"mainnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-mainnet-0\\\"}[3h]))\",\"projectName\":\"near-cs-mainnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"B\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-mainnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"C\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "D"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"D\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"F\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"D\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "E"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"E\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "F"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$${C}/$${E} > 0.80\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"F\",\"type\":\"math\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1m"
    annotations = {
      __dashboardUid__ = "defk916x2e0hsd"
      __panelId__      = "2"
      description      = "Check mainnet node memory, if error, set lower limit to reduce costs, otherwise scale accordingly"
      summary          = "[MAINNET]Memory Usage High on node"
    }
    labels    = {}
    is_paused = false

    notification_settings {
      contact_point = "SRE On-call"
    }
  }
  rule {
    name      = "Dev Node CPU Metrics"
    condition = "O"

    data {
      ref_id     = "A"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-0\\\"}[1s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"A\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "B"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-1\\\"}[1s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"B\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "C"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-2\\\"}[1s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"C\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "D"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-3\\\"}[1s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"D\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "E"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-4\\\"}[1s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"E\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "F"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-5\\\"}[1s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"F\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "G"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-6\\\"}[1s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"G\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "H"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-7\\\"}[1s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"H\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "I"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-8\\\"}[1s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"I\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "J"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-9\\\"}[1s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"J\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "K"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-10\\\"}[1s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"K\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "L"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-11\\\"}[1s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"L\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "M"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_cpu_limit_cores{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-0\\\"}[3h]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"M\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id = "N"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"N\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"N\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "O"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"O\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"P\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"O\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "P"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$N/$AB > 0.8 ||\\n$Q/$AB > 0.8 ||\\n$R/$AB > 0.8 ||\\n$S/$AB > 0.8 ||\\n$T/$AB > 0.8 ||\\n$U/$AB > 0.8 ||\\n$V/$AB > 0.8 ||\\n$W/$AB > 0.8 ||\\n$X/$AB > 0.8 ||\\n$Y/$AB > 0.8 ||\\n$Z/$AB > 0.8 ||\\n$AA/$AB > 0.8\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"P\",\"type\":\"math\"}"
    }
    data {
      ref_id = "Q"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"Q\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "R"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"C\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"R\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "S"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"D\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"S\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "T"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"E\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"T\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "U"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"F\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"U\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "V"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"G\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"V\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "W"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"H\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"W\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "X"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"I\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"X\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "Y"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"J\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"Y\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "Z"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"K\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"Z\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "AA"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"L\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"AA\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "AB"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"M\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"AB\",\"type\":\"reduce\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "1h"
    annotations = {
      __dashboardUid__ = "aefmio30pt3i8e"
      __panelId__      = "1"
      description      = "Check Dev nodes and decrease CPU limits if error, or scale as needed if increased traffic."
      summary          = "[DEV]CPU USAGE HIGH FOR 1H"
    }
    is_paused = false

    notification_settings {
      contact_point = "SRE On-call"
    }
  }
  rule {
    name      = "Dev Node Memory Metrics"
    condition = "O"

    data {
      ref_id     = "A"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-0\\\"}[30s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"A\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "B"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-1\\\"}[30s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"B\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "C"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-2\\\"}[30s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"C\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "D"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-3\\\"}[30s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"D\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "E"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-4\\\"}[30s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"E\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "F"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-5\\\"}[30s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"F\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "G"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-6\\\"}[30s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"G\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "H"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-7\\\"}[30s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"H\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "I"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-8\\\"}[30s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"I\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "J"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-9\\\"}[30s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"J\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "K"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-10\\\"}[30s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"K\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "L"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-11\\\"}[30s]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"L\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "M"
      query_type = "promQL"

      relative_time_range {
        from = 21600
        to   = 0
      }

      datasource_uid = "eefmhllfyfjswe"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"eefmhllfyfjswe\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_limit_bytes{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-dev\\\",location=\\\"europe-west1\\\",cluster_name=\\\"dev\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-dev-0\\\"}[3h]))\",\"projectName\":\"near-cs-dev\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"M\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-dev\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id = "N"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"N\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"N\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "O"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"O\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"P\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"O\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "P"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$N / $AB > 0.8 ||\\n$Q / $AB > 0.8 ||\\n$R / $AB > 0.8 ||\\n$S / $AB > 0.8 ||\\n$T / $AB > 0.8 ||\\n$U / $AB > 0.8 ||\\n$V / $AB > 0.8 ||\\n$W / $AB > 0.8 ||\\n$X / $AB > 0.8 ||\\n$Y / $AB > 0.8 ||\\n$Z / $AB > 0.8 ||\\n$AA / $AB > 0.8\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"P\",\"type\":\"math\"}"
    }
    data {
      ref_id = "Q"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"Q\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "R"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"C\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"R\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "S"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"D\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"S\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "T"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"E\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"T\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "U"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"F\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"U\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "V"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"G\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"V\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "W"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"H\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"W\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "X"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"I\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"X\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "Y"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"J\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"Y\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "Z"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"K\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"Z\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "AA"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"L\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"AA\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "AB"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"M\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"AB\",\"type\":\"reduce\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "1m"
    annotations = {
      __dashboardUid__ = "aefmio30pt3i8e"
      __panelId__      = "2"
      description      = "Check Dev nodes for high mem usage, if error reduce limits further, if high traffic scale accordingly"
      summary          = "[DEV]DEV NODE MEMORY USAGE HIGH"
    }
    is_paused = false

    notification_settings {
      contact_point = "SRE On-call"
    }
  }
  rule {
    name      = "Testnet Node CPU Metrics"
    condition = "K"

    data {
      ref_id     = "A"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-0\\\"}[1s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"A\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "B"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-1\\\"}[1s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"B\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "C"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-2\\\"}[1s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"C\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "D"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-3\\\"}[1s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"D\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "E"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-4\\\"}[1s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"E\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "F"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-5\\\"}[1s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"F\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "G"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-6\\\"}[1s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"G\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "H"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(rate(kubernetes_io:container_cpu_core_usage_time{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-7\\\"}[1s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"H\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "I"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_cpu_limit_cores{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-0\\\"}[3h]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"I\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id = "J"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"J\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"J\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "K"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"K\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"T\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"K\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "L"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"I\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"L\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "M"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"M\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "N"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"C\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"N\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "O"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"D\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"O\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "P"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"E\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"P\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "Q"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"F\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"Q\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "R"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"G\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"R\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "S"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"H\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"S\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "T"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$J/$L > 0.8 ||\\n$M/$L > 0.8 ||\\n$N/$L > 0.8 ||\\n$O/$L > 0.8 ||\\n$P/$L > 0.8 ||\\n$Q/$L > 0.8 ||\\n$R/$L > 0.8 ||\\n$S/$L > 0.8\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"T\",\"type\":\"math\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1h"
    annotations = {
      __dashboardUid__ = "cefmotn3trs3ke"
      __panelId__      = "1"
      description      = "Check Testnet nodes and decrease CPU limits if error, or scale as needed if increased traffic."
      summary          = "[TESTNET]CPU USAGE HIGH FOR 1H"
    }
    is_paused = false

    notification_settings {
      contact_point = "SRE On-call"
    }
  }
  rule {
    name      = "Testnet Node Memory Metrics"
    condition = "K"

    data {
      ref_id     = "A"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-0\\\"}[30s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"A\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "B"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-1\\\"}[30s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"B\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "C"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-2\\\"}[30s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"C\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "D"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-3\\\"}[30s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"D\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "E"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-4\\\"}[30s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"E\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "F"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-5\\\"}[30s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"F\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "G"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-6\\\"}[30s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"G\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "H"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_used_bytes{monitored_resource=\\\"k8s_container\\\",memory_type=\\\"non-evictable\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-7\\\"}[30s]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"H\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id     = "I"
      query_type = "promQL"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "cefmhlk39et4wb"
      model          = "{\"datasource\":{\"type\":\"stackdriver\",\"uid\":\"cefmhlk39et4wb\"},\"instant\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"promQLQuery\":{\"expr\":\"sum(avg_over_time(kubernetes_io:container_memory_limit_bytes{monitored_resource=\\\"k8s_container\\\",project_id=\\\"near-cs-testnet\\\",location=\\\"europe-west1\\\",cluster_name=\\\"testnet\\\",namespace_name=\\\"default\\\",metadata_system_top_level_controller_type=\\\"Deployment\\\",metadata_system_top_level_controller_name=\\\"multichain-testnet-0\\\"}[3h]))\",\"projectName\":\"near-cs-testnet\",\"step\":\"10s\"},\"queryType\":\"promQL\",\"range\":true,\"refId\":\"I\",\"timeSeriesList\":{\"filters\":[],\"groupBys\":[],\"projectName\":\"near-cs-testnet\",\"view\":\"FULL\"}}"
    }
    data {
      ref_id = "J"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"J\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"J\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "K"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"K\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"T\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"K\",\"type\":\"threshold\"}"
    }
    data {
      ref_id = "L"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"I\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"L\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "M"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"M\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "N"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"C\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"N\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "O"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"D\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"O\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "P"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"E\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"P\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "Q"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"F\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"Q\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "R"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"G\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"R\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "S"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"H\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"S\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "T"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0,0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[]},\"reducer\":{\"params\":[],\"type\":\"avg\"},\"type\":\"query\"}],\"datasource\":{\"name\":\"Expression\",\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"$J/$L > 0.8 ||\\n$M/$L > 0.8 ||\\n$N/$L > 0.8 ||\\n$O/$L > 0.8 ||\\n$P/$L > 0.8 ||\\n$Q/$L > 0.8 ||\\n$R/$L > 0.8 ||\\n$S/$L > 0.8\",\"hide\":false,\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"T\",\"type\":\"math\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1m"
    annotations = {
      __dashboardUid__ = "cefmotn3trs3ke"
      __panelId__      = "2"
      description      = "Check Testnet nodes for high mem usage, if error reduce limits further, if high traffic scale accordingly"
      summary          = "[TESTNET]TESTNET NODE MEMORY USAGE HIGH"
    }
    is_paused = false

    notification_settings {
      contact_point = "SRE On-call"
    }
  }
}
