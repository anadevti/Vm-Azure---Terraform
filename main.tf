terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.91.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-curso-terraform"
    storage_account_name = "aninhaterraform"
    container_name       = "container-terraform"
    key                  = "azure-vm/terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-curso-terraform"
    storage_account_name = "aninhaterraform"
    container_name       = "container-terraform"
    key                  = "azure-vnet/terraform.tfstate"
  }
}
 