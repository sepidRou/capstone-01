# define the Azure Storage Account and related resources
resource "azurerm_storage_account" "storage" {
  name                     = "capstonestorage123adn"     # must be unique globally
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
    tags = {
    environment = "capstone"
  }
}
