resource "azurerm_resource_group" "rg" {
  location = var.location
  name = "0_RG"
}
resource "azurerm_virtual_network" "vnet" {
  address_space = ["10.0.0.0/16"]
  location = var.location
  name = "1_VNet"
  resource_group_name = azurerm_resource_group.rg.name
  subnet {
    address_prefix = "10.0.1.0/24"
    name = "Subnet"
  }
}

resource "azurerm_network_security_group" "nsg" {
  location = var.location
  name = "NSG"
  resource_group_name = azurerm_resource_group.rg.name
  security_rule {
    access = "Allow"
    direction = "Inbound"
    name = "ssh"
    priority = 110
    protocol = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    access = "Allow"
    direction = "Inbound"
    name = "web"
    priority = 120
    protocol = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

