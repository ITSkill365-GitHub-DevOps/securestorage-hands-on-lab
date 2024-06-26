terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {
    organization = "az400labs"

    workspaces {
      name = "securestorage-hands-on-lab"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true

}

resource "azurerm_resource_group" "rg" {
  name     = "813-0f42c512-hands-on-with-terraform-on-azure"
  location = "West US"
}

module "securestorage" {
  source               = "app.terraform.io/az400labs/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "AliRezaITSkill365"
}