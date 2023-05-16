# Brief12-Terraform-Azure-VMs-cluster
To start, we have to use the "terraform init" command, from the inside of our project directory.

 The "terraform init" command initializes a working directory containing Terraform configuration files. This is the first command that should be run after writing a new Terraform configuration or cloning an existing one from version control. It is safe to run this command multiple times.

Command:
        $ terraform init

  After that, we have to use the command " terraform import", if we want to use a resource group already existed, with the name of our resource group and "Resource ID", we can find it in : Resource group/settings/Properties/

Command:
obab [ ~/brief_terraform ]$ terraform import azurerm_resource_group.obab-terraform-project /subscriptions/393e3de3-0900-4b72-8f1b-fb3b1d6b97f1/resourceGroups/obab-terraform-project 

  Then, we create a Terraform execution plan :
  
  Command:
        $ terraform plan -out main.tfplan

Run now "terraform apply" command to apply the execution plan to your cloud infrastructure
command:
        $ terraform apply main.tfplan