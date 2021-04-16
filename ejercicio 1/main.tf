resource "azurerm_resource_group" "rg" {
  location = var.location
  name = "0_RG"
}
resource "azurerm_virtual_network" "vnet" {
  address_space = ["10.0.0.0/16"]
  location = var.location
  name = "1_VNet"
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_subnet" "subnet" {
  address_prefix = "10.0.1.0/24"
  name = "subnet"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}
