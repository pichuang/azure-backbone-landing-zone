locals {
  sidecar_jpw_01 = {
    name                       = "sidecar-jpw-01"
    location                   = "japanwest"
    resource_group_name        = "rg-bb-sidecar-prd-jpw-01"
    address_prefix             = ["10.227.2.0/24", "10.227.3.0/24"]
    azfw_ip                    = "10.227.0.132"
    log_analytics_workspace_id = var.log_soc_prd_jpw_01_workspace_id
  }
}


# https://registry.terraform.io/modules/Azure/avm-res-network-virtualnetwork/azurerm/latest
module "vnet_sidecar_jpw_01" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.16.0"

  location             = azurerm_resource_group.rg_vnet_sidecar_jpw_01.location
  parent_id            = azurerm_resource_group.rg_vnet_sidecar_jpw_01.id
  address_space        = local.sidecar_jpw_01.address_prefix
  enable_telemetry     = false
  name                 = "vnet-${local.sidecar_jpw_01.name}"
  enable_vm_protection = true
  encryption = {
    # https://learn.microsoft.com/zh-tw/azure/virtual-network/virtual-network-encryption-overview
    # Azure Private DNS Resolver 不支援加密傳輸
    enabled     = false
    enforcement = "AllowUnencrypted"
  }
  flow_timeout_in_minutes = 4
  # dns_servers = {
  #   dns_servers = ["${local.sidecar_jpw_01.azfw_ip}"]
  # }
  #
  diagnostic_settings = {
    diag_logs = {
      name                           = "diag-logs"
      workspace_resource_id          = local.sidecar_jpw_01.log_analytics_workspace_id
      log_analytics_destination_type = "Dedicated" # Dedicated 就是 AzureDiagnostics
      log_groups                     = ["allLogs"]
    }
    diag_metrics = {
      name                           = "diag-metrics"
      workspace_resource_id          = local.sidecar_jpw_01.log_analytics_workspace_id
      log_analytics_destination_type = "Dedicated" # Dedicated 就是 AzureDiagnostics
      metric_categories              = ["AllMetrics"]
    }
  }
  #
  # ddos_protection_plan = {
  #   id = azurerm_network_ddos_protection_plan.this.id
  #   # due to resource cost
  #   enable = false
  # }
  #
  # bgp_community = ""
  subnets = {
    snet_dnspr_in = {
      name                                          = "snet-dnspr-in"
      address_prefixes                              = ["10.227.2.0/28"]
      default_outbound_access_enabled               = false
      private_endpoint_network_policies             = "Enabled"
      private_link_service_network_policies_enabled = true
      delegations = [
        {
          name = "delegation-dnspr-in"
          service_delegation = {
            name = "Microsoft.Network/dnsResolvers"
          }
        }
      ]
    }

    snet_dnspr_out = {
      name                                          = "snet-dnspr-out"
      address_prefixes                              = ["10.227.2.16/28"]
      default_outbound_access_enabled               = false
      private_endpoint_network_policies             = "Enabled"
      private_link_service_network_policies_enabled = true
      delegations = [
        {
          name = "delegation-dnspr-out"
          service_delegation = {
            name = "Microsoft.Network/dnsResolvers"
          }
        }
      ]
    }

    snet_ampls = {
      name                                          = "snet-ampls"
      address_prefixes                              = ["10.227.2.32/28"]
      default_outbound_access_enabled               = false
      private_endpoint_network_policies             = "Enabled"
      private_link_service_network_policies_enabled = true
    }

    snet_kvhsm = {
      name                                          = "snet-kvhsm"
      address_prefixes                              = ["10.227.2.48/29"]
      default_outbound_access_enabled               = false
      private_endpoint_network_policies             = "Enabled"
      private_link_service_network_policies_enabled = true
    }

    snet_kv = {
      name                                          = "snet-kv"
      address_prefixes                              = ["10.227.2.56/29"]
      default_outbound_access_enabled               = false
      private_endpoint_network_policies             = "Enabled"
      private_link_service_network_policies_enabled = true
    }

    snet_jumperbox = {
      name                                          = "snet-jumperbox"
      address_prefixes                              = ["10.227.2.64/28"]
      default_outbound_access_enabled               = false
      private_endpoint_network_policies             = "Enabled"
      private_link_service_network_policies_enabled = true
      network_security_group = {
        id = module.nsg_jumperbox.resource_id
      }
    }

    snet_azurebastionsubnet = {
      name                                          = "AzureBastionSubnet"
      address_prefixes                              = ["10.227.3.0/24"]
      default_outbound_access_enabled               = false
      private_endpoint_network_policies             = "Enabled"
      private_link_service_network_policies_enabled = true
      network_security_group = {
        id = module.nsg_azurebastionsubnet.resource_id
      }
    }
  }
}

#
# VNet Flow Logs Settings
#
# module "network_watcher_flow_log" {
#   source  = "Azure/avm-res-network-networkwatcher/azurerm//examples/flow-log"
#   version = "0.3.2"
#   enable_telemetry     = false
#   location             = local.sidecar_jpw_01.location
#   network_watcher_id   = data.azurerm_network_watcher.this.id
#   network_watcher_name = data.azurerm_network_watcher.this.name
#   resource_group_name  = data.azurerm_network_watcher.this.resource_group_name
#   flow_logs = {
#     vnet_flowlog = {
#       enabled            = true
#       name               = "fl-vnet" # not yet supported in the naming module
#       target_resource_id = azurerm_virtual_network.this.id
#       storage_account_id = azurerm_storage_account.this.id
#       version            = 2
#       retention_policy = {
#         days    = 30
#         enabled = true
#       }
#       traffic_analytics = {
#         enabled               = true
#         workspace_id          = azurerm_log_analytics_workspace.this.workspace_id
#         workspace_region      = var.region
#         workspace_resource_id = azurerm_log_analytics_workspace.this.id
#         interval_in_minutes   = 10
#       }
#     }
#   }
#   tags       = local.tags
#   depends_on = [data.azurerm_network_watcher.this]
# }

