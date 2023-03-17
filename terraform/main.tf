terraform {
  required_providers {
    checkpoint = {
      source = "CheckPointSW/checkpoint"
      #version = "2.3.0"
      version = "2.2.0"
    }
  }
}

provider "checkpoint" {
  # Configuration options
  server   = var.cp-management-host
  username = var.cp-management-user
  password = var.cp-management-password
  context  = var.cp-management-api-context
}

variable "cp-management-host" {
  type        = string
  description = "CHKP Management server hostname or IP address"
}

variable "cp-management-user" {
  type        = string
  description = "CHKP Management server username"
}
variable "cp-management-password" {
  type        = string
  description = "CHKP Management server password"
}
variable "cp-management-api-context" {
  type        = string
  description = "CHKP Management server context - defalts to web_api (in management server URL)"
  default     = "web_api"
}