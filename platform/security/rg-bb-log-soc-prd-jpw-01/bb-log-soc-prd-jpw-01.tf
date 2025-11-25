# 定義 Azure Firewall Policy
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy

locals {
  log_soc_prd_jpw_01 = {
    name                  = "log-soc-prd-jpw-01"
    resource_group_name   = "rg-log-soc-prd-jpw-01"
    location              = "${var.primary_location}"
    log_sku               = "PerGB2018"
    log_retention_in_days = 30 # 30 ~ 730
  }
}

resource "azurerm_resource_group" "rg_log_soc_prd_jpw_01" {
  name     = local.log_soc_prd_jpw_01.resource_group_name
  location = local.log_soc_prd_jpw_01.location
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace
resource "azurerm_log_analytics_workspace" "log_soc_prd_jpw_01" {
  name                                    = local.log_soc_prd_jpw_01.name
  location                                = azurerm_resource_group.rg_log_soc_prd_jpw_01.location
  resource_group_name                     = azurerm_resource_group.rg_log_soc_prd_jpw_01.name
  allow_resource_only_permissions         = true
  local_authentication_enabled            = false
  sku                                     = local.log_soc_prd_jpw_01.log_sku
  retention_in_days                       = local.log_soc_prd_jpw_01.log_retention_in_days
  daily_quota_gb                          = -1
  internet_ingestion_enabled              = false
  internet_query_enabled                  = false
  immediate_data_purge_on_30_days_enabled = false
}
