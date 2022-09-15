variable "friendly_name_prefix" {
  type        = string
  description = "Friendly name prefix for unique Azure resource naming across deployments."

  validation {
    condition     = can(regex("^[[:alnum:]]+$", var.friendly_name_prefix)) && length(var.friendly_name_prefix) < 13
    error_message = "Must only contain alphanumeric characters and be less than 13 characters."
  }
}

variable "common_tags" {
  type        = map(string)
  description = "Map of common tags for taggable Azure resources."
  default     = {}
}
/*
common_tags = {
  App       = "output-testing"
  Env       = "test"
  Terraform = "cli"
  Owner     = "Jeff McCollum"
}
*/