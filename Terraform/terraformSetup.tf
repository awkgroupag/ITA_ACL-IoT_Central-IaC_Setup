terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

# A more elegant solution would be to store this data as env variables

  backend "azurerm" {
      resource_group_name  = "rg-euwe-di-iotiac"
      storage_account_name = "tfstate1a2b341"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}
