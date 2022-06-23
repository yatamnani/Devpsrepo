variable "Existing_RGname" {
  description = "The name of the resource group in which the resources will be created"
  source = "azure.resourcegroup.list_resource_group_names"
}

variable "Existing_vnetname" {
  description = "Mention name of the Existing Virtual network"
  source = "azure.virtual_network.list_virtual_network"
}

variable "Existing_Subnetname" {
  description = "Mention name of the Existing Subnet"
  source = "azure.virtual_network.list_subnet"
 
}

variable "Public_ipname" {
  description = "Name of the New public IP address"
  default     = "terrapip"
  type        = string
}

variable "vmname" {
  description = "Name of the new Virtual machine"
  type        = string
}

variable "admin_username" {
  description = "Name of the Virtual machine admin user"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "Mention password of the Virtual machine"
  type        = "securestring"
  sensitive   = true
}

variable "storage_account_type" {
  description = "mention managed disk type"
  default     = "Standard_LRS"
  type        = string
  allowedValues = [
    "Standard_LRS",
    "StandardSSD_LRS",
    "Premium_LRS"
  ]

}

variable "sku" {
  description = "mention the sku of the virtual machine"
  default     = "2016-Datacenter"
  type        = string
  allowedValues = [
        "2008-R2-SP1",
        "2008-R2-SP1-smalldisk",
        "2008-R2-SP1-zhcn",
        "2012-Datacenter",
        "2012-datacenter-gensecond",
        "2012-Datacenter-smalldisk",
        "2012-Datacenter-zhcn",
        "2012-R2-Datacenter",
        "2012-r2-datacenter-gensecond",
        "2012-R2-Datacenter-smalldisk",
        "2012-R2-Datacenter-zhcn",
        "2016-Datacenter",
        "2016-datacenter-gensecond",
        "2016-Datacenter-Server-Core",
        "2016-Datacenter-Server-Core-smalldisk",
        "2016-Datacenter-smalldisk",
        "2016-Datacenter-with-Containers",
        "2016-Datacenter-with-RDSH",
        "2016-Datacenter-zhcn",
        "2019-Datacenter",
        "2019-Datacenter-Core",
        "2019-Datacenter-Core-smalldisk",
        "2019-Datacenter-Core-with-Containers",
        "2019-Datacenter-Core-with-Containers-smalldisk",
        "2019-datacenter-gensecond",
        "2019-Datacenter-smalldisk",
        "2019-Datacenter-with-Containers",
        "2019-Datacenter-with-Containers-smalldisk",
        "2019-Datacenter-zhcn",
        "2022-datacenter",
        "2022-datacenter-g2",
        "2022-datacenter-azure-edition"
      ]
}

variable "size" {
  description = "mention the size of the virtual machine"
  source = "azure.instance_size.list_instance_size"
}
