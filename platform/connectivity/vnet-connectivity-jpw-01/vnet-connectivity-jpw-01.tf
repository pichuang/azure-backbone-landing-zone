locals {
  connectivity_jpw_01 = {
    name           = "connectivity-jpw-01"
    location       = "japanwest"
    address_prefix = "10.227.2.0/24"
  }
}

resource "azurerm_resource_group" "rg_vnet_connect_jpw_01" {
  name     = "rg-${local.connectivity_jpw_01.name}"
  location = local.connectivity_jpw_01.location
}

# https://registry.terraform.io/modules/Azure/avm-res-network-virtualnetwork/azurerm/latest
module "vnet_connectivity_jpw_01" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.16.0"

  location             = azurerm_resource_group.rg_vnet_connect_jpw_01.location
  parent_id            = azurerm_resource_group.rg_vnet_connect_jpw_01.id
  address_space        = [local.connectivity_jpw_01.address_prefix]
  enable_telemetry     = false
  name                 = "vnet-${local.connectivity_jpw_01.name}"
  enable_vm_protection = true
  encryption = {
    enabled = true
    #enforcement = "DropUnencrypted"  # NOTE: This preview feature requires approval, leaving off in example: Microsoft.Network/AllowDropUnecryptedVnet
    enforcement = "AllowUnencrypted"
  }
  flow_timeout_in_minutes = 4
  # dns_servers = {
  #   dns_servers = ["8.8.8.8", "1.1.1.1", "1.0.0.1"]
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
    snet_dnspr_in_jpw = {
      name                            = "snet-dnspr-in-jpw"
      address_prefixes                = ["10.227.2.0/28"]
      default_outbound_access_enabled = false
    }

    snet_dnspr_out_jpw = {
      name                            = "snet-dnspr-out-jpw"
      address_prefixes                = ["10.227.2.16/28"]
      default_outbound_access_enabled = false
    }
  }
}