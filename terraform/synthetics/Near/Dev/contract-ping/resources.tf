terraform {
  backend "gcs" {
    bucket = "near-multichain-state-dev"
    prefix = "state/tools/contract-ping"
  }
}

provider "google" {
  project = "near-cs-dev"
}

provider "google" {
  project = "sig-shared-network"
  alias   = "something"
}