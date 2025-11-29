#
# 定義 Virtual Hub: vhub-azure-jpw-prd-01
# 主要獨立提供 Azure Spoke 服務使用
#

locals {
  vhub_azure_jpw_prd_01 = {
    name                       = "azure-jpw-prd-01"
    location                   = "japanwest"
    address_prefix             = "10.227.0.0/23" # 正式需要使用 /23
    vhub_capacity              = 2               # 2 ~ 50
    ergw_scale_units           = 1               # 1 ~ 10
    azfw_public_ip_count       = 1               # 1 ~ 249
    zones                      = ["1", "2", "3"]
    dnspr_inbound_ip           = "10.227.2.4"
    log_analytics_workspace_id = var.log_soc_prd_jpw_01_workspace_id
  }

  afw_diag_log_categories = [
    "AZFWNetworkRule",
    "AZFWApplicationRule",
    "AZFWNatRule",
    "AZFWThreatIntel",
    "AZFWIdpsSignature",
    "AZFWDnsQuery",
    "AZFWFqdnResolveFailure",
    "AZFWFatFlow",
    "AZFWFlowTrace",
    "AZFWNetworkRuleAggregation",
    "AZFWApplicationRuleAggregation",
    "AZFWNatRuleAggregation"
  ]
}

#
# 建立 Virtual Hub 資源本體
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub
resource "azurerm_virtual_hub" "vhub_azure_jpw_prd_01" {
  name                                   = "vhub-${local.vhub_azure_jpw_prd_01.name}"
  resource_group_name                    = azurerm_resource_group.rg_vwan_prd_global_01.name
  location                               = local.vhub_azure_jpw_prd_01.location
  virtual_wan_id                         = azurerm_virtual_wan.vwan_prd_global_01.id
  address_prefix                         = local.vhub_azure_jpw_prd_01.address_prefix
  branch_to_branch_traffic_enabled       = true
  virtual_router_auto_scale_min_capacity = local.vhub_azure_jpw_prd_01.vhub_capacity
  hub_routing_preference                 = "ASPath"
  sku                                    = "Standard"
  tags                                   = local.tags_connectivity
}

#
# 定義 Virtual Hub 內的 ExpressRoute Gateway
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/express_route_gateway.html
# resource "azurerm_express_route_gateway" "ergw_azure_jpw_prd_01" {
#   name                = "ergw-${local.vhub_azure_jpw_prd_01.name}"
#   resource_group_name = azurerm_resource_group.rg_vwan_prd_global_01.name
#   location            = azurerm_virtual_hub.vhub_azure_jpw_prd_01.location
#   allow_non_virtual_wan_traffic = true
#   virtual_hub_id      = azurerm_virtual_hub.vhub_azure_jpw_prd_01.id
#   scale_units         = local.vhub_azure_jpw_prd_01.ergw_scale_units
# }

#
# 定義 Virtual Hub 內的 Azure Firewall
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall
resource "azurerm_firewall" "afw_azure_jpw_prd_01" {
  name                = "afw-${local.vhub_azure_jpw_prd_01.name}"
  location            = azurerm_virtual_hub.vhub_azure_jpw_prd_01.location
  resource_group_name = azurerm_resource_group.rg_vwan_prd_global_01.name
  sku_name            = "AZFW_Hub"
  sku_tier            = "Premium"
  private_ip_ranges   = ["IANAPrivateRanges"]
  # 由防火牆原則控管威脅情報設定，明確指定會觸發 400 AzureFirewallDoesNotAcceptThreatIntelModeInSku

  virtual_hub {
    virtual_hub_id  = azurerm_virtual_hub.vhub_azure_jpw_prd_01.id
    public_ip_count = local.vhub_azure_jpw_prd_01.azfw_public_ip_count
  }

  zones              = local.vhub_azure_jpw_prd_01.zones
  firewall_policy_id = var.afwp_azure_jpw_prd_01_id

  tags = local.tags_connectivity
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub_routing_intent
resource "azurerm_virtual_hub_routing_intent" "route_intent_azure_jpw_prd_01" {
  name           = "route-intent-${local.vhub_azure_jpw_prd_01.name}"
  virtual_hub_id = azurerm_virtual_hub.vhub_azure_jpw_prd_01.id

  routing_policy {
    name         = "InternetTrafficPolicy"
    destinations = ["Internet"]
    next_hop     = azurerm_firewall.afw_azure_jpw_prd_01.id
  }

  routing_policy {
    name         = "PrivateTrafficPolicy"
    destinations = ["PrivateTraffic"]
    next_hop     = azurerm_firewall.afw_azure_jpw_prd_01.id
  }
}

#
resource "azurerm_monitor_diagnostic_setting" "diag_afw_azure_jpw_prd_01_logs" {
  name                       = "diag-logs"
  target_resource_id         = azurerm_firewall.afw_azure_jpw_prd_01.id
  log_analytics_workspace_id = local.vhub_azure_jpw_prd_01.log_analytics_workspace_id

  log_analytics_destination_type = "Dedicated" # a.k.a Resource-specific workspace

  enabled_log { category = "AZFWNetworkRule" }
  enabled_log { category = "AZFWApplicationRule" }
  enabled_log { category = "AZFWNatRule" }
  enabled_log { category = "AZFWThreatIntel" }
  enabled_log { category = "AZFWIdpsSignature" }
  enabled_log { category = "AZFWDnsQuery" }
  enabled_log { category = "AZFWFqdnResolveFailure" }
  enabled_log { category = "AZFWFatFlow" }
  enabled_log { category = "AZFWFlowTrace" }
  enabled_log { category = "AZFWNetworkRuleAggregation" }
  enabled_log { category = "AZFWApplicationRuleAggregation" }
  enabled_log { category = "AZFWNatRuleAggregation" }

}

resource "azurerm_monitor_diagnostic_setting" "diag_afw_azure_jpw_prd_01_metrics" {
  name                       = "diag-metrics"
  target_resource_id         = azurerm_firewall.afw_azure_jpw_prd_01.id
  log_analytics_workspace_id = local.vhub_azure_jpw_prd_01.log_analytics_workspace_id

  log_analytics_destination_type = "AzureDiagnostics"

  enabled_metric {
    category = "AllMetrics"
  }
}