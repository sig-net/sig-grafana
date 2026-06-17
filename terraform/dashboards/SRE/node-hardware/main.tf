locals {
  sre_folder_uid = "befk4ud4xv5s0d"
}

resource "grafana_dashboard" "dev_node_hardware" {
  folder      = local.sre_folder_uid
  config_json = file("${path.module}/dev_node_hardware.json")
}

import {
  to = grafana_dashboard.dev_node_hardware
  id = "aefmio30pt3i8e"
}

resource "grafana_dashboard" "mainnet_node_hardware" {
  folder      = local.sre_folder_uid
  config_json = file("${path.module}/mainnet_node_hardware.json")
}

import {
  to = grafana_dashboard.mainnet_node_hardware
  id = "defk916x2e0hsd"
}

resource "grafana_dashboard" "testnet_node_hardware" {
  folder      = local.sre_folder_uid
  config_json = file("${path.module}/testnet_node_hardware.json")
}

import {
  to = grafana_dashboard.testnet_node_hardware
  id = "cefmotn3trs3ke"
}
