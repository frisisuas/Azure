resource "azurerm_virtual_machine" "VM" {
  count = 2
  location              = var.location
  name                  = "4VM${count.index}"
  network_interface_ids = ["${element(azurerm_network_interface.nic.*.id, count.index)}"]
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
    name              = "VM-OS-${count.index}"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = var.ssh
      path = "/home/${var.usuario}/.ssh/authorized_keys"
    }
  }
  os_profile {
    admin_username = var.usuario
    computer_name  = "4VM${count.index}"
  }
  boot_diagnostics {
    enabled     = false
    storage_uri = ""
  }
}