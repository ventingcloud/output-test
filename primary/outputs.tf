output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.example.name
}

output "storage_container_name" {
  description = "The name of the storage container"
  value       = azurerm_storage_container.example.name
}
/*
output "storage_account" {
  description = "All storage account attributes"
  value       = azurerm_storage_account.example
  sensitive = true
}

output "storage_container" {
  description = "All storage container attributes"
  value       = azurerm_storage_container.example
  sensitive = true
}
*/
/*
output "storage_account_non_sensitive" {
  description = "All storage account attributes"
  value       = nonsensitive(azurerm_storage_account.example)
  sensitive   = false
}
*/