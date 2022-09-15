terraform {
  cloud {
    organization = "ventingcloud"

    workspaces {
      name = "output-test-primary"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.22.0"
    }
  }
}

provider "azurerm" {
  environment = "public"
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "vc-hcl-output-test"
  location = "East US"

  tags = merge(
    { "Name" = "${var.friendly_name_prefix}-rg" },
    var.common_tags
  )
}

resource "azurerm_storage_account" "example" {
  name                     = "vchcloutputtest"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = merge(
    { "Name" = "${var.friendly_name_prefix}-sa" },
    var.common_tags
  )
}

resource "azurerm_storage_container" "example" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

