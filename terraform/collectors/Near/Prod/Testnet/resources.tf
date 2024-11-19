variable "project_id" {
  default     = "near-cs-testnet"
  description = "The default project id to use for resources in this directory."
}

terraform {
  backend "gcs" {
    bucket = "near-multichain-state-testnet"
    prefix = "state/prom_collector"
  }
}

provider "google" {
  project = "near-cs-testnet"
}

provider "google" {
  project = "sig-shared-network"
  alias   = "network"
}
