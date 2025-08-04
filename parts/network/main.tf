# Remove RG creation here — it is now handled in root

# Create a Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "capstone-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Public Subnet
resource "azurerm_subnet" "public_subnet" {
  name                 = "public-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Private Subnet
resource "azurerm_subnet" "private_subnet" {
  name                 = "private-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# NSG for public subnet
resource "azurerm_network_security_group" "public_nsg" {
  name                = "public-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# NSG for private subnet
resource "azurerm_network_security_group" "private_nsg" {
  name                = "private-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Associate public NSG
resource "azurerm_subnet_network_security_group_association" "public_assoc" {
  subnet_id                 = azurerm_subnet.public_subnet.id
  network_security_group_id = azurerm_network_security_group.public_nsg.id
}

# Associate private NSG
resource "azurerm_subnet_network_security_group_association" "private_assoc" {
  subnet_id                 = azurerm_subnet.private_subnet.id
  network_security_group_id = azurerm_network_security_group.private_nsg.id
}
