terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }
}



#   backend "azurerm" {
#     resource_group_name  = var.name
#     storage_account_name = "<your_storage_account>"
#     container_name       = "<your_container>"
#     key                  = "terraform.tfstate"
#   }


provider "azurerm" {
  features {}
  subscription_id = "75330da7-9d4b-4fbe-bb6f-8c4125ece9a6"
}
