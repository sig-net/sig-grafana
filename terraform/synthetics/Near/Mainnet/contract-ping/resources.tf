terraform {
  backend "gcs" {
    bucket = "near-multichain-state-mainnet"
    prefix = "state/tools/contract-ping"
  }
}

provider "google" {
  project = "near-cs-mainnet"
}

provider "google" {
  project = "sig-shared-network"
  alias   = "something"
}