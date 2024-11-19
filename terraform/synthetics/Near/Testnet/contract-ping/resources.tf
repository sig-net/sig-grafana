terraform {
  backend "gcs" {
    bucket = "near-multichain-state-testnet"
    prefix = "state/tools/contract-ping"
  }
}

provider "google" {
  project = "near-cs-testnet"
}

provider "google" {
  project = "sig-shared-network"
  alias   = "network"
}