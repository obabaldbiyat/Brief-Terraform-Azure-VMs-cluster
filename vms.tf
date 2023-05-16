 resource "azurerm_virtual_machine" "obab-terraform-project" {
   count                 = 2
   name                  = "acctvm${count.index}"
   location              = azurerm_resource_group.obab-terraform-project.location
   availability_set_id   = azurerm_availability_set.avset.id
   resource_group_name   = azurerm_resource_group.obab-terraform-project.name
   network_interface_ids = [element(azurerm_network_interface.obab-terraform-project.*.id, count.index)]
   vm_size               = "Standard_DS1_v2"

   # Uncomment this line to delete the OS disk automatically when deleting the VM
   # delete_os_disk_on_termination = true

   # Uncomment this line to delete the data disks automatically when deleting the VM
   # delete_data_disks_on_termination = true

   storage_image_reference {
     publisher = "Canonical"
     offer     = "UbuntuServer"
     sku       = "16.04-LTS"
     version   = "latest"
   }

   storage_os_disk {
     name              = "myosdisk${count.index}"
     caching           = "ReadWrite"
     create_option     = "FromImage"
     managed_disk_type = "Standard_LRS"
   }
   
   os_profile {
     computer_name  = "oaldbiyat"
     admin_username = "obabadmin"
     admin_password = "Azertyuiop1234!"
   }

   os_profile_linux_config {
     disable_password_authentication = false
   }

   tags = {
     environment = "staging"
   }
 }

#Creat data disk
 resource "azurerm_managed_disk" "obab-terraform-project" {
   count                = 2
   name                 = "datadisk_existing_${count.index}"
   location             = azurerm_resource_group.obab-terraform-project.location
   resource_group_name  = azurerm_resource_group.obab-terraform-project.name
   storage_account_type = "Standard_LRS"
   create_option        = "Empty"
   disk_size_gb         = "20"
 }
