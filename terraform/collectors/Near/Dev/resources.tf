variable "project_id" {
  default     = "near-cs-dev"
  description = "The default project id to use for resources in this directory."
}

terraform {
  backend "gcs" {
    bucket = "near-multichain-state-dev"
    prefix = "state/prom_collector"
  }
}

provider "google" {
  project = "near-cs-dev"
}

provider "google" {
  project = "sig-shared-network"
  alias   = "network"
}
