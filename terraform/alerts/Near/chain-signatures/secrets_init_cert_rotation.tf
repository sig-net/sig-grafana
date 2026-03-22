resource "grafana_rule_group" "rule_group_secrets_init_cert_rotation" {
  name             = "secrets-init-cert-rotation"
  folder_uid       = "multichain"
  interval_seconds = 60

  rule {
    name      = "[DEV] [SECRETS-INIT] Cert rotation check failed"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"editorMode\":\"code\",\"expr\":\"max by(namespace, secret) (1 - secrets_init_cert_rotation_last_run_success{environment=\\\"dev\\\",job=\\\"secrets-init-cert-rotation\\\"})\",\"instant\":false,\"intervalMs\":60000,\"legendFormat\":\"{{namespace}}/{{secret}}\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"B\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"B\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 900
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.5],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "15m"
    annotations = {
      summary = "The kube-secrets-init cert rotation CronJob last reported a failure in dev."
    }
    labels = {
      environment = "dev"
      service     = "secrets-init"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }

  rule {
    name      = "[DEV] [SECRETS-INIT] Cert rotation check stale"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 129600
        to   = 0
      }

      datasource_uid = "grafanacloud-prom"
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"editorMode\":\"code\",\"expr\":\"time() - max by(namespace, secret) (secrets_init_cert_rotation_last_success_timestamp_seconds{environment=\\\"dev\\\",job=\\\"secrets-init-cert-rotation\\\"})\",\"instant\":false,\"intervalMs\":60000,\"legendFormat\":\"{{namespace}}/{{secret}}\",\"maxDataPoints\":43200,\"range\":true,\"refId\":\"A\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 129600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"B\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"B\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 129600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[129600],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "15m"
    annotations = {
      summary = "The kube-secrets-init cert rotation CronJob has not reported a successful check in the last 36 hours in dev."
    }
    labels = {
      environment = "dev"
      service     = "secrets-init"
    }
    is_paused = false

    notification_settings {
      contact_point = "Multichain Dev"
      group_by      = null
      mute_timings  = null
    }
  }
}
