terraform {
  cloud {
    organization = "ventingcloud"

    workspaces {
      name = "output-test-secondary"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.22.0"
    }
    tfe = {
      version = "0.36.1"
    }
  }
}

provider "azurerm" {
  environment = "public"
  features {}
}

provider "tfe" {
  hostname = "app.terraform.io"
}

data "tfe_outputs" "outputs" {
  organization = "ventingcloud"
  workspace    = "output-test-primary"
}


resource "azurerm_storage_blob" "example" {
  name                   = "hello-world.txt"
  storage_account_name   = data.tfe_outputs.outputs.values.storage_account_name
  storage_container_name = data.tfe_outputs.outputs.values.storage_container_name
  type                   = "Block"
  source                 = "${path.module}/files/hello-world.txt"
}


