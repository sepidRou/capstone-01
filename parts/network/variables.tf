# Define the name of the resource group as a string variable
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

# Define the location (Azure region) as a string variable
variable "location" {
  description = "Azure region"
  type        = string
}
