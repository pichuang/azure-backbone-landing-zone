#
# 定義 Virtual Hub: vhub-azure-jpe-prod-01
# 主要獨立提供 Azure Spoke 服務使用
#

locals {
  vhub_azure_jpe_prod_01 = {
    name     = "azure-jpe-prod-01"
    location = "japaneast"
    #TODO 需要更換正式的位址區段
    address_prefix       = "10.227.0.0/23" # 正式需要使用 /23
    vhub_capacity        = 2               # 2 ~ 50
    ergw_scale_units     = 1               # 1 ~ 10
    azfw_public_ip_count = 1               # 1 ~ 10
    zones                = ["1", "2", "3"]
  }
}

#
# 建立 Virtual Hub 資源本體
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub
resource "azurerm_virtual_hub" "vhub_azure_jpe_prod_01" {
  name                                   = "vhub-${local.vhub_azure_jpe_prod_01.name}"
  resource_group_name                    = azurerm_resource_group.rg_vwan_global_01.name
  location                               = local.vhub_azure_jpe_prod_01.location
  virtual_wan_id                         = azurerm_virtual_wan.vwan_global_01.id
  address_prefix                         = local.vhub_azure_jpe_prod_01.address_prefix
  branch_to_branch_traffic_enabled       = true
  virtual_router_auto_scale_min_capacity = local.vhub_azure_jpe_prod_01.vhub_capacity
  hub_routing_preference                 = "ASPath"
  sku                                    = "Standard"
  tags                                   = local.tags_connectivity
}

#
# 定義 Virtual Hub 內的 ExpressRoute Gateway
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/express_route_gateway.html
resource "azurerm_express_route_gateway" "ergw_azure_jpe_prod_01" {
  name                = "ergw-${local.vhub_azure_jpe_prod_01.name}"
  resource_group_name = azurerm_resource_group.rg_vwan_global_01.name
  location            = azurerm_virtual_hub.vhub_azure_jpe_prod_01.location
  virtual_hub_id      = azurerm_virtual_hub.vhub_azure_jpe_prod_01.id
  scale_units         = local.vhub_azure_jpe_prod_01.ergw_scale_units
}

#
# 定義 Virtual Hub 內的 Azure Firewall
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall
resource "azurerm_firewall" "afw_azure_jpe_prod_01" {
  name                = "afw-${local.vhub_azure_jpe_prod_01.name}"
  location            = azurerm_virtual_hub.vhub_azure_jpe_prod_01.location
  resource_group_name = azurerm_resource_group.rg_vwan_global_01.name
  sku_name            = "AZFW_Hub"
  sku_tier            = "Premium"
  threat_intel_mode   = "Deny"

  virtual_hub {
    virtual_hub_id  = azurerm_virtual_hub.vhub_azure_jpe_prod_01.id
    public_ip_count = local.vhub_azure_jpe_prod_01.azfw_public_ip_count
  }

  zones = local.vhub_azure_jpe_prod_01.zones

  # TODO
  # firewall_policy_id
  # ip_configuration
  # dns_servers
  # dns_proxy_enabled
  # private_ip_ranges
  # management_ip_configuration

  tags = local.tags_connectivity
}