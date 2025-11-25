# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_private_link_scope

locals {
  ampls_jpw_01 = {
    name = "ampls-jpw-01"
  }
}

resource "azurerm_monitor_private_link_scope" "ampls_jpw_01" {
  name                = local.ampls_jpw_01.name
  resource_group_name = azurerm_resource_group.rg_vnet_sidecar_jpw_01.name

  ingestion_access_mode = "Open" # Open | PrivateOnly
  query_access_mode     = "Open" # Open | PrivateOnly
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_private_link_scoped_service
resource "azurerm_monitor_private_link_scoped_service" "link_to_log_soc_prd_jpw_01" {
  name                = "link-to-log-soc-prd-jpw-01"
  resource_group_name = azurerm_resource_group.rg_vnet_sidecar_jpw_01.name
  scope_name          = azurerm_monitor_private_link_scope.ampls_jpw_01.name
  linked_resource_id  = azurerm_log_analytics_workspace.log_soc_prd_jpw_01.id
}