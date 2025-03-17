terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
  cloud {

    organization = "MY-LAB-TF"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id            = "9734ed68-621d-47ed-babd-269110dbacb1"
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-ac7f3a5b-hands-on-with-terraform-on-azure"
  location = "eastus"
}

module "storageaccount" {
  source  = "app.terraform.io/MY-LAB-TF/storageaccount/module"
  version = "1.0.0"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "monsupersatop852"
}