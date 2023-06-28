terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.58.0"
    }
  }

  # backend "azurerm" {
  #   resource_group_name  = "my-rg1"
  #   storage_account_name = "azurestoragetask1"
  #   container_name       = "azurecontainertask1"
  #   key                  = "terraform.tfstate"
  }
#}

provider "azurerm" {
  features {}
}
