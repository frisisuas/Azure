resource "azurerm_virtual_machine" "VM" {
  location              = var.location
  name                  = "VM"
  network_interface_ids = [azurerm_network_interface.nic.id]
  resource_group_name   = azurerm_resource_group.rg.name
  vm_size               = "Standard_B1s"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    create_option     = "FromImage"
    name              = "VM-OS"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  os_profile {
    admin_username = var.usuario
    admin_password = var.password
    computer_name  = "VM"
  }
  boot_diagnostics {
    enabled     = false
    storage_uri = ""
  }
}