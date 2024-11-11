provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "azuredemo-rg"
  location = "South India"
}

resource "azurerm_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "P0V3"  # Correctly enclosed in double quotes
}
