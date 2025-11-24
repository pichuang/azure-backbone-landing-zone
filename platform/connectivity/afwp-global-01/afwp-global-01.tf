# 定義 Azure Firewall Policy
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy

locals {
  afwp_global_01 = {
    name                  = "afwp-global-01"
    log_sku               = "PerGB2018"
    log_retention_in_days = 30 # 30 ~ 730
  }
}

resource "azurerm_resource_group" "rg_afwp_global_01" {
  name     = "rg-${local.afwp_global_01.name}"
  location = "japanwest"
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy
resource "azurerm_firewall_policy" "afwp_global_01" {
  name                     = local.afwp_global_01.name
  resource_group_name      = azurerm_resource_group.rg_afwp_global_01.name
  location                 = azurerm_resource_group.rg_afwp_global_01.location
  sku                      = "Premium"
  threat_intelligence_mode = "Deny"

  dns {
    proxy_enabled = true
    servers = [
      "8.8.8.8",
    ]
  }

  insights {
    enabled                            = true
    default_log_analytics_workspace_id = azurerm_log_analytics_workspace.log_afwp_global_01.id
    retention_in_days                  = local.afwp_global_01.log_retention_in_days
  }

  intrusion_detection {
    mode = "Deny"
  }
}


# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace
resource "azurerm_log_analytics_workspace" "log_afwp_global_01" {
  name                                    = "log-${local.afwp_global_01.name}"
  location                                = azurerm_resource_group.rg_afwp_global_01.location
  resource_group_name                     = azurerm_resource_group.rg_afwp_global_01.name
  allow_resource_only_permissions         = true
  local_authentication_enabled            = false
  sku                                     = local.afwp_global_01.log_sku
  retention_in_days                       = local.afwp_global_01.log_retention_in_days
  daily_quota_gb                          = -1
  internet_ingestion_enabled              = false
  internet_query_enabled                  = false
  immediate_data_purge_on_30_days_enabled = false
}
