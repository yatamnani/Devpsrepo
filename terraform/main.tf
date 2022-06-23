data "azurerm_resource_group" "RG" {
  name                = var.Existing_RGname
}

data "azurerm_virtual_network" "vnet" {
  name                = var.Existing_vnetname
  resource_group_name =  data.azurerm_resource_group.RG.name
}


data "azurerm_subnet" "subnet" {
  name                 = var.Existing_Subnetname
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.RG.name
}


# Create public IPs
resource "azurerm_public_ip" "publicIP" {
    name                         = var.Public_ipname
    location                     = "${data.azurerm_resource_group.RG.location}"
    resource_group_name          = "${data.azurerm_resource_group.RG.name}"
    allocation_method            = "Dynamic"

}

resource "azurerm_network_interface" "nic" {
  name                = "vm-nic"
  location            = "${data.azurerm_resource_group.RG.location}"
  resource_group_name = "${data.azurerm_resource_group.RG.name}"

   ip_configuration {
    name                          = "internal"
    subnet_id                     = "${data.azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.publicIP.id}"
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.vmname
  resource_group_name = "${data.azurerm_resource_group.RG.name}"
  location            ="${data.azurerm_resource_group.RG.location}"
  size                = var.size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = ["${azurerm_network_interface.nic.id}"]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }
source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.sku
    version   = "latest"
  }
tags = {
    "Owner" = "nagaraju"
    "Team" = "cloudops" 
    "Purpose" = "testing"

  }  
}
