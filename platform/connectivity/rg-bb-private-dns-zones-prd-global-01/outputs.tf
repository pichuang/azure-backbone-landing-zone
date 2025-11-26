output "privatelink_vaultcore_azure_net_id" {
  description = "Resource ID for privatelink.vaultcore.azure.net private DNS zone"
  value       = azurerm_private_dns_zone.privatelink_vaultcore_azure_net.id
}
