terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

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

resource "azurerm_resource_group" "rg" {
    name = "rg-euwe-di-iotiac"
    location = "westeurope"
    tags = {
      "owner" = "joel.beimler@awk.ch"
    }
}

resource "azurerm_iotcentral_application" "iotCentral" {
  name                = "cloud-iot-central-tf"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sub_domain          = "dabc"

  display_name = "iot-application"
  sku          = "ST2"
  template = "32a80a53-a875-4ffc-b64a-590557aef153"
} 

