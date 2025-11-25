# 定義 Azure Firewall Policy
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy

locals {
  afwp_azure_jpw_prod_01 = {
    name                               = "afwp-azure-jpw-prod-01"
    log_sku                            = "PerGB2018"
    log_retention_in_days              = 30 # 30 ~ 730
    default_log_analytics_workspace_id = azurerm_log_analytics_workspace.log_soc_prd_jpw_01.id
    # 要寫當前區域的 Private DNS Resolver Inbound IP
    dnspr_inbound_ip = "10.227.2.4"
  }
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy
resource "azurerm_firewall_policy" "afwp_azure_jpw_prod_01" {
  name                     = local.afwp_azure_jpw_prod_01.name
  resource_group_name      = azurerm_resource_group.rg_afwp_azure_jpw_prod_01.name
  location                 = azurerm_resource_group.rg_afwp_azure_jpw_prod_01.location
  sku                      = "Premium"
  threat_intelligence_mode = "Deny"

  base_policy_id = azurerm_firewall_policy.afwp_global_01.id

  dns {
    proxy_enabled = true
    servers = [
      "${local.afwp_azure_jpw_prod_01.dnspr_inbound_ip}"
    ]
  }

  insights {
    enabled                            = true
    default_log_analytics_workspace_id = local.afwp_azure_jpw_prod_01.default_log_analytics_workspace_id
    retention_in_days                  = local.afwp_azure_jpw_prod_01.log_retention_in_days
  }

}


