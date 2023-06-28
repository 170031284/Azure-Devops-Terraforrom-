# # Define the resource group
# resource "azurerm_resource_group" "example" {
#   name     = "my-rg1"
#   location = "West Europe"
# }

# # Define the virtual network
# resource "azurerm_virtual_network" "example" {
#   name                = "my-vnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#   depends_on = [azurerm_resource_group.example]
# }

# # Define the subnets
# resource "azurerm_subnet" "subnet1" {
#   name                 = "subnet-1"
#   resource_group_name  = azurerm_resource_group.example.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.1.0/24"]
#   depends_on = [azurerm_resource_group.example]
# }

# resource "azurerm_subnet" "subnet2" {
#   name                 = "subnet-2"
#   resource_group_name  = azurerm_resource_group.example.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.2.0/24"]
#   depends_on = [azurerm_resource_group.example]
# }

# # Create the Linux VM
# resource "azurerm_linux_virtual_machine" "linux_vm" {
#   name                = "linux"
#   location            = "North Europe"
#   resource_group_name = "azurerm_resource_group.example.name"
#   size                = "Standard_DS2_v2"
#   admin_username      = "admin_username"  # Replace with your desired admin username
#   admin_password = "tRAM*1432"
#   disable_password_authentication = false

#   network_interface_ids = [azurerm_network_interface.linux_vm_nic.id]
  

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#     disk_size_gb         = 128
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "16.04-LTS"
#     version   = "latest"
#   }
#   depends_on = [azurerm_resource_group.example]
# }

# # # Create the Windows VM
# # resource "azurerm_windows_virtual_machine" "windows_vm" {
# #   name                = "windows"
# #   location            = "West Europe"
# #   resource_group_name = "azurerm_resource_group.example.name"
# #   size                = "Standard_DS2_v2"
# #   admin_username      = "admin_username"  # Replace with your desired admin username
# #   admin_password      = "tRAM*1432"  # Replace with your desired admin password

# #   network_interface_ids = [azurerm_network_interface.windows_vm_nic.id]

# #   os_disk {
# #     caching              = "ReadWrite"
# #     storage_account_type = "Standard_LRS"
# #     disk_size_gb         = 128
# #   }

# #   source_image_reference {
# #     publisher = "MicrosoftWindowsServer"
# #     offer     = "WindowsServer"
# #     sku       = "2019-Datacenter"
# #     version   = "latest"
# #   }
# #   depends_on = [azurerm_resource_group.example]
# # }

# # Define network interfaces for the VMs
# resource "azurerm_network_interface" "linux_vm_nic" {
#   name                = "linux-vm-nic"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.subnet1.id
#     private_ip_address_allocation = "Dynamic"
#   }
#   depends_on = [azurerm_resource_group.example]
# }

# # resource "azurerm_network_interface" "windows_vm_nic" {
# #   name                = "windows-vm-nic"
# #   location            = azurerm_resource_group.example.location
# #   resource_group_name = azurerm_resource_group.example.name

# #   ip_configuration {
# #     name                          = "internal"
# #     subnet_id                     = azurerm_subnet.subnet2.id
# #     private_ip_address_allocation = "Dynamic"
# #   }
# #   depends_on = [azurerm_resource_group.example]
# # }
