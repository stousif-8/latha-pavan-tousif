resource "azurerm_app_service" "example" {
  name                = "deployment-app-latha-syed-pavan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_service_plan.example.id

  site_config {
    linux_fx_version = "NODE|18"
  }
}
