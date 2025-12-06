# https://registry.terraform.io/modules/Azure/avm-res-network-networksecuritygroup
# https://learn.microsoft.com/zh-tw/azure/bastion/bastion-nsg
locals {
  nsg_rules_jumperbox = {
    #
    # Inbound
    #
    "in-allow-azurebastionsubnet" = {
      name                       = "in-allow-azurebastionsubnet"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      source_address_prefix      = "10.227.3.0/24" # AzureBastionSubnet
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_ranges    = ["22", "3389"]
      protocol                   = "Tcp"
      description                = "允許來自 Azure Bastion 子網路的 SSH 和 RDP 流量"
    }
    "in-deny-all-others" = {
      name                       = "in-deny-all-others"
      priority                   = 4096
      direction                  = "Inbound"
      access                     = "Deny"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_range     = "*"
      protocol                   = "*"
      description                = "拒絕所有其他 inbound traffic"
    }
    #
    # Outbound
    #
    "out-allow-icmp" = {
      name                       = "out-allow-icmp"
      priority                   = 100
      direction                  = "Outbound"
      access                     = "Allow"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_range     = "*"
      protocol                   = "Icmp"
      description                = "允許對外輸出 ICMP 流量"
    }

    "out-allow-trust-networks" = {
      name                       = "out-allow-trust-networks"
      access                     = "Allow"
      priority                   = 200
      direction                  = "Outbound"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "10.0.0.0/8"
      destination_port_ranges    = ["0-65535"]
      protocol                   = "Tcp"
      description                = "允許對信任網路輸出 TCP 流量"
    }

    "out-deny-internet" = {
      name                       = "out-deny-internet"
      access                     = "Deny"
      direction                  = "Outbound"
      priority                   = 4096
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "Internet"
      destination_port_range     = "*"
      protocol                   = "*"
      description                = "拒絕對 Internet 的所有對外流量"
    }
  }
}

module "nsg_jumperbox" {
  source              = "Azure/avm-res-network-networksecuritygroup/azurerm"
  version             = "0.5.0"
  enable_telemetry    = false
  resource_group_name = local.rg_vnet_sidecar_jpw_01.resource_group_name
  location            = local.rg_vnet_sidecar_jpw_01.location
  name                = "nsg-jumperbox"
  security_rules      = local.nsg_rules_jumperbox

  diagnostic_settings = {
    diag_logs = {
      name                           = "diag-logs"
      log_groups                     = ["allLogs"]
      log_analytics_destination_type = "Dedicated"
      workspace_resource_id          = local.sidecar_jpw_01.log_analytics_workspace_id
    }
  }
}