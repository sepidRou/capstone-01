output "app_service_name" {
  description = "The name of the deployed App Service"
  value       = azurerm_windows_web_app.frontend.name
}
