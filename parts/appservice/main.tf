resource "azurerm_service_plan" "app_service_plan" {
  name                = "capstone-app-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Windows"
  sku_name            = "F1"
}

resource "azurerm_windows_web_app" "frontend" {
  name                = "capstone-frontend-app"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {
    always_on = false
  }

  https_only = true
}
