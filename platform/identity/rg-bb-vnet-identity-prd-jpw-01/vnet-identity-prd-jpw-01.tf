locals {
  identity_prd_jpw_01 = {
    name                = "identity-prd-jpw-01"
    location            = "japanwest"
    resource_group_name = "rg-bb-vnet-identity-prd-jpw-01"
    address_prefix      = "10.227.4.0/24"
    azfw_ip             = "10.227.2.1"
  }
}

resource "azurerm_resource_group" "rg_vnet_identity_prd_jpw_01" {
  name     = local.identity_prd_jpw_01.resource_group_name
  location = local.identity_prd_jpw_01.location
}

# https://registry.terraform.io/modules/Azure/avm-res-network-virtualnetwork/azurerm/latest
module "vnet_identity_prd_jpw_01" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.16.0"

  location             = azurerm_resource_group.rg_vnet_identity_prd_jpw_01.location
  parent_id            = azurerm_resource_group.rg_vnet_identity_prd_jpw_01.id
  address_space        = [local.identity_prd_jpw_01.address_prefix]
  enable_telemetry     = false
  name                 = "vnet-${local.identity_prd_jpw_01.name}"
  enable_vm_protection = true
  encryption = {
    # https://learn.microsoft.com/zh-tw/azure/virtual-network/virtual-network-encryption-overview
    # Azure Private DNS Resolver 不支援這個做法
    enabled     = true
    enforcement = "AllowUnencrypted"
  }
  flow_timeout_in_minutes = 4
  # dns_servers = {
  #   dns_servers = ["${local.identity_prd_jpw_01.azfw_ip}"]
  # }
  #
  # diagnostic_settings = {
  #   sendToLogAnalytics = {
  #     name                           = "sendToLogAnalytics"
  #     workspace_resource_id          = azurerm_log_analytics_workspace.this.id
  #     log_analytics_destination_type = "Dedicated"
  #   }
  # }
  #
  # ddos_protection_plan = {
  #   id = azurerm_network_ddos_protection_plan.this.id
  #   # due to resource cost
  #   enable = false
  # }
  #
  # bgp_community = ""
  subnets = {
    snet_adds = {
      name                            = "snet-adds"
      address_prefixes                = ["10.227.4.0/28"]
      default_outbound_access_enabled = false
    }
  }
}