# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Call the network part (module)
module "network" {
  source = "./parts/network"

# Pass required variables
  resource_group_name = var.resource_group_name
  location            = var.location
}

# Call the compute part (module)
module "compute" {
  source              = "./parts/compute"

# Pass required variables
  resource_group_name = var.resource_group_name
  location            = var.location
  private_subnet_id   = module.network.private_subnet_id
  ssh_public_key_path = var.ssh_public_key_path
}

