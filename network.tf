#Create Virtual Networks > Create Spoke Virtual Network
 resource "azurerm_virtual_network" "obab-terraform-project" {
   name                = "acctvn"
   address_space       = ["10.0.0.0/16"]
   location            = azurerm_resource_group.obab-terraform-project.location
   resource_group_name = azurerm_resource_group.obab-terraform-project.name
 }

#Create Subnet
 resource "azurerm_subnet" "obab-terraform-project" {
   name                 = "acctsub"
   resource_group_name  = azurerm_resource_group.obab-terraform-project.name
   virtual_network_name = azurerm_virtual_network.obab-terraform-project.name
   address_prefixes     = ["10.0.2.0/24"]
 }

#Create public IP
 resource "azurerm_public_ip" "obab-terraform-project" {
   name                         = "publicIPForLB"
   location                     = azurerm_resource_group.obab-terraform-project.location
   resource_group_name          = azurerm_resource_group.obab-terraform-project.name
   allocation_method            = "Static"
 }
