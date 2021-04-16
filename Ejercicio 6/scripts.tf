resource "azurerm_virtual_machine_extension" "installweb" {
  count = 2
  name = "installweb"
  publisher = "Microsoft.Azure.Extensions"
  type = "CustomScript"
  type_handler_version = "2.0"
  virtual_machine_id = azurerm_virtual_machine.VM[count.index].id

  settings = <<SETTINGS
  {
    "script": "${filebase64("web.sh")}"
  }
SETTINGS
}