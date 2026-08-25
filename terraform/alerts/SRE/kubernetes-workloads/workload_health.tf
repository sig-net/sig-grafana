locals {
  sre_folder_uid            = "befk4ud4xv5s0d"
  near_k8s_dashboard_uid    = "sre-near-k8s-workloads"
  stackdriver_relative_from = 1800
  stackdriver_step          = "60s"
  cpu_request_panel_ids     = { dev = 1, testnet = 2, mainnet = 3 }
  memory_limit_panel_ids    = { dev = 4, testnet = 5, mainnet = 6 }
  restart_panel_ids         = { dev = 7, testnet = 8, mainnet = 9 }

  near_clusters = {
    dev = {
      display_name     = "Dev"
      summary_prefix   = "[DEV][K8S]"
      project_id       = "near-cs-dev"
      location         = "europe-west1"
      cluster_name     = "dev"
      datasource_uid   = "eefmhllfyfjswe"
      namespaces_regex = "^(default|chain-sig|contract-watcher|contract-pinger|arc-runners|chainstack-faucet)$"
      contact_point    = "SRE On-call"
      priority         = "low"
    }
    testnet = {
      display_name     = "Testnet"
      summary_prefix   = "[TESTNET][K8S]"
      project_id       = "near-cs-testnet"
      location         = "europe-west1"
      cluster_name     = "testnet"
      datasource_uid   = "cefmhlk39et4wb"
      namespaces_regex = "^(default|chain-sig)$"
      contact_point    = "SRE On-call"
      priority         = "high"
    }
    mainnet = {
      display_name     = "Mainnet"
      summary_prefix   = "[MAINNET][K8S]"
      project_id       = "near-cs-mainnet"
      location         = "europe-west1"
      cluster_name     = "mainnet"
      datasource_uid   = "aefk7aww1brb4c"
      namespaces_regex = "^default$"
      contact_point    = "SRE On-call"
      priority         = "high"
    }
  }

  cpu_request_rules = {
    for key, cluster in local.near_clusters : "${key}_cpu_request_high" => {
      name           = "${cluster.display_name} workload CPU request utilization high"
      datasource_uid = cluster.datasource_uid
      project_id     = cluster.project_id
      expr = format(
        "max by (namespace_name, metadata_system_top_level_controller_type, metadata_system_top_level_controller_name) (max_over_time(kubernetes_io:container_cpu_request_utilization{monitored_resource=\"k8s_container\",project_id=\"%s\",location=\"%s\",cluster_name=\"%s\",namespace_name=~\"%s\",container_name!=\"POD\"}[15m]))",
        cluster.project_id,
        cluster.location,
        cluster.cluster_name,
        cluster.namespaces_regex,
      )
      threshold     = 0.90
      comparator    = "gt"
      duration      = "15m"
      panel_id      = local.cpu_request_panel_ids[key]
      no_data_state = "OK"
      contact_point = cluster.contact_point
      priority      = cluster.priority
      environment   = key
      description   = "Workload CPU request utilization has stayed above 90 percent for at least 15 minutes. This usually means requests are too small for current steady-state usage or replicas need tuning."
      summary       = "${cluster.summary_prefix} workload CPU request utilization high"
    }
  }

  memory_limit_rules = {
    for key, cluster in local.near_clusters : "${key}_memory_limit_high" => {
      name           = "${cluster.display_name} workload memory limit utilization high"
      datasource_uid = cluster.datasource_uid
      project_id     = cluster.project_id
      expr = format(
        "max by (namespace_name, metadata_system_top_level_controller_type, metadata_system_top_level_controller_name) (max_over_time(kubernetes_io:container_memory_limit_utilization{monitored_resource=\"k8s_container\",project_id=\"%s\",location=\"%s\",cluster_name=\"%s\",namespace_name=~\"%s\",container_name!=\"POD\"}[15m]))",
        cluster.project_id,
        cluster.location,
        cluster.cluster_name,
        cluster.namespaces_regex,
      )
      threshold     = 0.90
      comparator    = "gt"
      duration      = "10m"
      panel_id      = local.memory_limit_panel_ids[key]
      no_data_state = "OK"
      contact_point = cluster.contact_point
      priority      = cluster.priority
      environment   = key
      description   = "Workload memory limit utilization has stayed above 90 percent for at least 10 minutes. This is an early warning for OOM pressure and under-sized memory limits."
      summary       = "${cluster.summary_prefix} workload memory limit utilization high"
    }
  }

  restart_rules = {
    for key, cluster in local.near_clusters : "${key}_restart_increase" => {
      name           = "${cluster.display_name} workload restart count increasing"
      datasource_uid = cluster.datasource_uid
      project_id     = cluster.project_id
      expr = format(
        "sum by (namespace_name, pod_name, container_name, metadata_system_top_level_controller_type, metadata_system_top_level_controller_name) (increase(kubernetes_io:container_restart_count{monitored_resource=\"k8s_container\",project_id=\"%s\",location=\"%s\",cluster_name=\"%s\",namespace_name=~\"%s\",container_name!=\"POD\"}[15m]))",
        cluster.project_id,
        cluster.location,
        cluster.cluster_name,
        cluster.namespaces_regex,
      )
      threshold     = 3
      comparator    = "gt"
      duration      = "5m"
      panel_id      = local.restart_panel_ids[key]
      no_data_state = "OK"
      contact_point = cluster.contact_point
      priority      = cluster.priority
      environment   = key
      description   = "One or more workload containers restarted more than three times over the last 15 minutes. This is a practical crash-loop and pod-error early warning when kube-state metrics are not available in Grafana."
      summary       = "${cluster.summary_prefix} workload restart count increasing"
    }
  }

  near_kubernetes_workload_rules = merge(
    local.cpu_request_rules,
    local.memory_limit_rules,
    local.restart_rules,
  )
}

resource "grafana_rule_group" "sre_near_kubernetes_workloads" {
  name             = "sre near kubernetes workloads"
  folder_uid       = local.sre_folder_uid
  interval_seconds = 60

  dynamic "rule" {
    for_each = local.near_kubernetes_workload_rules
    content {
      name      = rule.value.name
      condition = "C"

      data {
        ref_id     = "A"
        query_type = "promQL"

        relative_time_range {
          from = local.stackdriver_relative_from
          to   = 0
        }

        datasource_uid = rule.value.datasource_uid
        model = jsonencode({
          datasource    = { type = "stackdriver", uid = rule.value.datasource_uid }
          instant       = false
          intervalMs    = 1000
          maxDataPoints = 43200
          promQLQuery = {
            expr        = rule.value.expr
            projectName = rule.value.project_id
            step        = local.stackdriver_step
          }
          queryType = "promQL"
          range     = true
          refId     = "A"
          timeSeriesList = {
            filters     = []
            groupBys    = []
            projectName = rule.value.project_id
            view        = "FULL"
          }
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
      for            = rule.value.duration
      annotations = {
        __dashboardUid__ = local.near_k8s_dashboard_uid
        __panelId__      = tostring(rule.value.panel_id)
        description      = rule.value.description
        summary          = rule.value.summary
      }
      labels = {
        environment = rule.value.environment
        priority    = rule.value.priority
        service     = "multichain"
        team        = "sre"
      }
      is_paused = false

      notification_settings {
        contact_point = rule.value.contact_point
      }
    }
  }
}
