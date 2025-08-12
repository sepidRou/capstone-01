# Variable for the resource group name
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

# Variable for Azure location
variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "ssh_public_key_path" {
  type = string
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}
