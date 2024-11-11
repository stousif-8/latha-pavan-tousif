terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.70"  # Use latest 3.x version, adjust as necessary
    }
  }
}

provider "azurerm" {
  features {}  # This is defined as an empty block, as required by azurerm
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

# Create an App Service plan
resource "azurerm_service_plan" "example" {
  name                = "example-service-plan"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

# Create a Linux web app
resource "azurerm_linux_web_app" "example" {
  name                = "example-web-app"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {
    # Add configuration settings here if needed
  }
}
