# 定義 Azure Firewall Policy
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy

locals {
  afwp_global_01 = {
    name                               = "afwp-global-01"
    log_sku                            = "PerGB2018"
    log_retention_in_days              = 30 # 30 ~ 730
    default_log_analytics_workspace_id = azurerm_log_analytics_workspace.log_soc_prd_jpw_01.id
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

  insights {
    enabled                            = true
    default_log_analytics_workspace_id = local.afwp_global_01.default_log_analytics_workspace_id
    retention_in_days                  = local.afwp_global_01.log_retention_in_days
  }

  intrusion_detection {
    mode = "Deny"
  }
}


