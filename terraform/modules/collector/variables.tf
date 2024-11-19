variable "account_id" {
  type    = string
  default = "grafana-agent-sa"
}

variable "display_name" {
  type    = string
  default = "grafana-agent-sa"
}

variable "location" {
  type    = string
  default = "europe-west1"
}

variable "service" {
  type = string
}

variable "vpc_connector" {
  type = string
}

variable "image" {
  type = string
}

variable "project_id" {
  type = string
}

variable "file_path" {
  default     = "./agent.yaml"
  type        = string
  description = "local file path of the agent config file"
}