


  # NIC resource with IP configuration
  resource "azurerm_network_interface" "nic" {
    name                = var.nic_name
    location            = var.location
    resource_group_name = var.resource_group_name
    ip_configuration {
      name                          = "ipconfig1"
      subnet_id                     = var.subnet_id
      private_ip_address_allocation = "Dynamic"
    }
  }

  resource "azurerm_virtual_machine" "vm" {
    name                  = var.name
    location              = var.location
    resource_group_name   = var.resource_group_name
    network_interface_ids = [azurerm_network_interface.nic.id]
    vm_size               = var.vm_size

    storage_os_disk {
      name              = "osdisk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    # Add other required attributes
}
