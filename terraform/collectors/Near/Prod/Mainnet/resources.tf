variable "project_id" {
  default     = "near-cs-mainnet"
  description = "The default project id to use for resources in this directory."
}

terraform {
  backend "gcs" {
    bucket = "near-multichain-state-mainnet"
    prefix = "state/prom_collector"
  }
}

provider "google" {
  project = "near-cs-mainnet"
}

provider "google" {
  project = "sig-shared-network"
  alias   = "network"
}
