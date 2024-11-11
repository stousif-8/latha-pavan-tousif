provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "azuredemo-rg"
  location = "South India"
}

resource "azurerm_service_plan" "example" {
  name                = "testing"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "B1"  # Correctly enclosed in double quotes
}
resource "azurerm_app_service" "example" {
  name                = "deployment-app"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_service_plan.example.id

  site_config {
    linux_fx_version = "NODE|18"
  }
}
