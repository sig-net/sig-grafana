locals {
  canton_dashboard_uid = "canton-nodes"
  sre_folder_uid       = "befk4ud4xv5s0d"

  canton_alert_contacts = {
    dev     = "Multichain Dev"
    testnet = "SRE On-call"
    mainnet = "SRE On-call"
  }

  canton_availability_rules = [
    {
      name          = "[DEV][CANTON] Participant metrics target down"
      environment   = "dev"
      app           = "participant"
      contact_point = local.canton_alert_contacts.dev
      summary       = "[DEV][CANTON] Participant metrics target is down"
      description   = "Participant metrics target in canton-validator is down in dev."
    },
    {
      name          = "[TESTNET][CANTON] Participant metrics target down"
      environment   = "testnet"
      app           = "participant"
      contact_point = local.canton_alert_contacts.testnet
      summary       = "[TESTNET][CANTON] Participant metrics target is down"
      description   = "Participant metrics target in canton-validator is down in testnet."
    },
    {
      name          = "[MAINNET][CANTON] Participant metrics target down"
      environment   = "mainnet"
      app           = "participant"
      contact_point = local.canton_alert_contacts.mainnet
      summary       = "[MAINNET][CANTON] Participant metrics target is down"
      description   = "Participant metrics target in canton-validator is down in mainnet."
    },
    {
      name          = "[DEV][CANTON] Validator app metrics target down"
      environment   = "dev"
      app           = "validator-app"
      contact_point = local.canton_alert_contacts.dev
      summary       = "[DEV][CANTON] Validator app metrics target is down"
      description   = "Validator app metrics target in canton-validator is down in dev."
    },
    {
      name          = "[TESTNET][CANTON] Validator app metrics target down"
      environment   = "testnet"
      app           = "validator-app"
      contact_point = local.canton_alert_contacts.testnet
      summary       = "[TESTNET][CANTON] Validator app metrics target is down"
      description   = "Validator app metrics target in canton-validator is down in testnet."
    },
    {
      name          = "[MAINNET][CANTON] Validator app metrics target down"
      environment   = "mainnet"
      app           = "validator-app"
      contact_point = local.canton_alert_contacts.mainnet
      summary       = "[MAINNET][CANTON] Validator app metrics target is down"
      description   = "Validator app metrics target in canton-validator is down in mainnet."
    },
  ]
}

resource "grafana_rule_group" "canton_validator_availability" {
  name             = "canton_validator_availability"
  folder_uid       = local.sre_folder_uid
  interval_seconds = 60

  dynamic "rule" {
    for_each = local.canton_availability_rules

    content {
      name      = rule.value.name
      condition = "C"

      data {
        ref_id = "A"

        relative_time_range {
          from = 600
          to   = 0
        }

        datasource_uid = "grafanacloud-prom"
        model = jsonencode({
          datasource = {
            type = "prometheus"
            uid  = "grafanacloud-prom"
          }
          editorMode          = "builder"
          expr                = "max by(app) (up{environment=\"${rule.value.environment}\", namespace=\"canton-validator\", app=\"${rule.value.app}\"})"
          fullMetaSearch      = false
          includeNullMetadata = true
          instant             = false
          interval            = ""
          intervalMs          = 60000
          legendFormat        = "__auto"
          maxDataPoints       = 43200
          range               = true
          refId               = "A"
          useBackend          = false
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
          conditions = [
            {
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
            }
          ]
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
          conditions = [
            {
              evaluator = {
                params = [1]
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
            }
          ]
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

      no_data_state  = "Alerting"
      exec_err_state = "Error"
      for            = "5m"
      annotations = {
        __dashboardUid__ = local.canton_dashboard_uid
        __panelId__      = "2"
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
