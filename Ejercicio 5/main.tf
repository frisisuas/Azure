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
resource "azurerm_network_security_group" "nsg" {
  location = var.location
  name = "2_NSG"
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
resource "azurerm_network_interface" "nic" {
  #indicamos que cuente 2 (empezando por el 0 y acabando en 1)
  count = 2
  location = var.location
  name = "3_NIC_${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name = "ipprivada_${count.index}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip[count.index].id
    subnet_id = azurerm_subnet.subnet.id
  }
}

resource "azurerm_public_ip" "pip" {
  count = 2
  location = var.location
  name = "pip_${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Dynamic"
  sku = "Basic"
}