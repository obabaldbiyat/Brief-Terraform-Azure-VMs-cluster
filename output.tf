output "resource_group_name" {
  value = azurerm_resource_group.obab-terraform-project.name
}

output "region" {
  value = azurerm_resource_group.obab-terraform-project.location
}

output "acctvm0" {
  value = azurerm_network_interface.obab-terraform-project[0].private_ip_address
}

output "acctvm1" {
  value = azurerm_network_interface.obab-terraform-project[1].private_ip_address
}

output "IpPub_LoadBalancer" {
  value = azurerm_public_ip.obab-terraform-project.ip_address
}

