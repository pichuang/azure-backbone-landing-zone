# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_private_link_scope

locals {
  ampls_global_01 = {
    name = "ampls-global-01"
  }
}

resource "azurerm_monitor_private_link_scope" "ampls_global_01" {
  name                = local.ampls_global_01.name
  resource_group_name = azurerm_resource_group.rg_vnet_sidecar_jpw_01.name

  ingestion_access_mode = "PrivateOnly" # Open | PrivateOnly
  query_access_mode     = "PrivateOnly" # Open | PrivateOnly
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_private_link_scoped_service
resource "azurerm_monitor_private_link_scoped_service" "link_to_log_soc_prd_global_01" {
  name                = "link-to-log-soc-prd-global-01"
  resource_group_name = azurerm_resource_group.rg_vnet_sidecar_jpw_01.name
  scope_name          = azurerm_monitor_private_link_scope.ampls_global_01.name
  linked_resource_id  = var.log_soc_prd_jpw_01_workspace_id
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint
# resource "azurerm_private_endpoint" "pe_ampls_global_01" {
#   name                          = "pep-ampls-global-01"
#   location                      = azurerm_resource_group.rg_vnet_sidecar_jpw_01.location
#   resource_group_name           = azurerm_resource_group.rg_vnet_sidecar_jpw_01.name
#   custom_network_interface_name = "nic-pep-ampls-global-01"
#   subnet_id                     = module.vnet_sidecar_jpw_01.subnets["snet_ampls"].id

#   private_service_connection {
#     name = "privateserviceconnection-ampls-global-01"
#     # private_connection_resource_id = azurerm_storage_account.example.id
#     private_connection_resource_alias = "Microsoft.Insights/privatelinkscopes"
#     subresource_names                 = ["azuremonitor"]
#     is_manual_connection              = false
#   }

#   private_dns_zone_group {
#     name = "private-dns-zone-group-ampls"
#     private_dns_zone_ids = [
#       var.privatelink_monitor_azure_com_id,
#       var.privatelink_oms_opinsights_azure_com_id,
#       var.privatelink_ods_opinsights_azure_com_id,
#       var.privatelink_agentsvc_azure_automation_net_id,
#       var.privatelink_blob_core_windows_net_id
#     ]
#   }

# }
