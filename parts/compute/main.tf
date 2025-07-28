# 1. Create a Network Interface (NIC) for the VM
resource "azurerm_network_interface" "vm_nic" {
  name                = "capstone-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.private_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

# Linux VM for backend processing
resource "azurerm_linux_virtual_machine" "backend_vm" {
  name                = "capstone-vm"                       # Name of the VM
  resource_group_name = var.resource_group_name             # RG from input
  location            = var.location                        # Location from input
  size                = "Standard_B1s"                      # Small, low-cost VM
  admin_username      = "azureuser"                         # SSH login user

  network_interface_ids = [
    azurerm_network_interface.vm_nic.id                     # Link NIC (defined next)
  ]

  os_disk {
    name                 = "capstone-osdisk"                # OS disk name
    caching              = "ReadWrite"                      # Disk cache mode
    storage_account_type = "Standard_LRS"                   # Standard storage
  }

  source_image_reference {
    publisher = "Canonical"                                 # Ubuntu publisher
    offer     = "UbuntuServer"                              # Type of image
    sku       = "18.04-LTS"                                 # Ubuntu version
    version   = "latest"                                    # Always latest
  }

  admin_ssh_key {
    username   = "azureuser"                                # Match login user
    public_key = file(var.ssh_public_key_path)              # Load your SSH key
  }
}

