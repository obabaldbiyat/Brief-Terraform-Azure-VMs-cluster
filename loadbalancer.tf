 #Create Load Balancer
 resource "azurerm_lb" "obab-terraform-project" {
   name                = "loadBalancer"
   location            = azurerm_resource_group.obab-terraform-project.location
   resource_group_name = azurerm_resource_group.obab-terraform-project.name

   frontend_ip_configuration {
     name                 = "publicIPAddress"
     public_ip_address_id = azurerm_public_ip.obab-terraform-project.id
   }
 }

#Create Backend Address Pool
 resource "azurerm_lb_backend_address_pool" "obab-terraform-project" {
   loadbalancer_id     = azurerm_lb.obab-terraform-project.id
   name                = "BackEndAddressPool"
 }

#Automated Backend Pool Addition > Gem Configuration to add the network interfaces of the VMs to the backend pool.
 resource "azurerm_network_interface" "obab-terraform-project" {
   count               = 2
   name                = "acctni${count.index}"
   location            = azurerm_resource_group.obab-terraform-project.location
   resource_group_name = azurerm_resource_group.obab-terraform-project.name

   ip_configuration {
     name                          = "obab-terraform-projectConfiguration"
     subnet_id                     = azurerm_subnet.obab-terraform-project.id
     private_ip_address_allocation = "dynamic"
   }
 }

 resource "azurerm_availability_set" "avset" {
   name                         = "avset"
   location                     = azurerm_resource_group.obab-terraform-project.location
   resource_group_name          = azurerm_resource_group.obab-terraform-project.name
   platform_fault_domain_count  = 2
   platform_update_domain_count = 2
   managed                      = true
 }
