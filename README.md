
---


Bienvenidos a mi repositorio sobre Azure y Terraform

Ante todo, me gustaría presentarme, mi nombre es Raúl Carvajal Bustos y este respositorio, se ha creado con la intención de compartir los conocimientos que voy aprendiendo gracias al [Master de Tajamar](https://fpprofessionaleducation.tajamar.es/informatica/masteres-de-especializacion-en-microsoft-cisco-aws/administracion-sistemas-multicloud-devops-azure-aws/).

Mi intención, es la de realizar un documento para realizar diferentes despliegues mediante la herramienta de Hashicorp: Terraform, todo ello en la nube de Azure. A medida que el tiempo lo permita, añadiré otros proveedores tales: Google Cloud y AWS.

Voy a ir creando diferentes "carpetas" con los ejercicios paso a paso. Empezaré con el ejercicio 0 con lo más básico e iré subiendo hasta algo más complejo de realizar. Todo el procedimiento será detallado con capturas y explicaciones del porqué de las cosas.

Un ejemplo del codigo que voy a utilizar para hacer un despliegue de terraform:

~~~
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
~~~
---
**Podrás encontrarme en:**
<https://www.linkedin.com/in/raulcarvajal/>

**Email:**
<raulcarvajalbustos@outlook.es>

**O en la comunidad de telegram Azurebrains**
<https://t.me/azureespanya>
