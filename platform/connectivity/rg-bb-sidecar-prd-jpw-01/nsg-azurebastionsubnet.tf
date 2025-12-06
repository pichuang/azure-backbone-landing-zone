# https://registry.terraform.io/modules/Azure/avm-res-network-networksecuritygroup
# https://learn.microsoft.com/zh-tw/azure/bastion/bastion-nsg
locals {
  nsg_rules_azurebastionsubnet = {
    # Inbound
    "in-allow-gatewaymanager" = {
      name                       = "in-allow-gatewaymanager"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      source_address_prefix      = "GatewayManager"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_ranges    = ["443"]
      protocol                   = "Tcp"
      description                = "用於 Azure Bastion 控制平面通訊所必需"
    }
    "in-allow-bastionhostcommunication" = {
      name                       = "in-allow-bastionhostcommunication"
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Allow"
      source_address_prefix      = "VirtualNetwork"
      source_port_range          = "*"
      destination_address_prefix = "VirtualNetwork"
      destination_port_ranges    = ["5701", "8080"]
      protocol                   = "Tcp"
      description                = "用於 Azure Bastion Host 之間通訊。"
    }
    "in-deny-all-others" = {
      name                       = "in-deny-all-others"
      priority                   = 4096
      direction                  = "Inbound"
      access                     = "Deny"
      source_address_prefix      = "Internet"
      source_port_range          = "*"
      destination_address_prefix = "VirtualNetwork"
      destination_port_range     = "*"
      protocol                   = "*"
      description                = "拒絕所有其他 inbound traffic"
    }

    # Outbound
    "out-allow-jumperbox" = {
      name                       = "out-allow-jumperbox"
      access                     = "Allow"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "VirtualNetwork" # snet-jumperbox
      destination_port_ranges    = ["22", "3389"]
      direction                  = "Outbound"
      priority                   = 100
      protocol                   = "Tcp"
      description                = "允許連線到 Jumperbox 子網路的 SSH 和 RDP 流量"
    }
    "out-allow-gatewaymanager" = {
      name                       = "out-allow-gatewaymanager"
      access                     = "Allow"
      source_address_prefix      = "VirtualNetwork"
      source_port_range          = "*"
      destination_address_prefix = "GatewayManager"
      destination_port_ranges    = ["80", "443"]
      direction                  = "Outbound"
      priority                   = 200
      protocol                   = "Tcp"
      description                = "允許 Bastion 對 GatewayManager 的必要 80/443 流量"
    }
    "out-allow-bastionhostcommunication" = {
      name                       = "out-allow-bastionhostcommunication"
      access                     = "Allow"
      source_address_prefix      = "VirtualNetwork"
      source_port_range          = "*"
      destination_address_prefix = "VirtualNetwork"
      destination_port_ranges    = ["5701", "8080"]
      direction                  = "Outbound"
      priority                   = 300
      protocol                   = "Tcp"
      description                = "允許 Azure Bastion Host 之間的 outbound 通訊"
    }
    "out-allow-azurecloud" = {
      name                       = "out-allow-azurecloud"
      access                     = "Allow"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "AzureCloud"
      destination_port_ranges    = ["443"]
      direction                  = "Outbound"
      priority                   = 400
      protocol                   = "Tcp"
      description                = "允許連線至 AzureCloud 進行更新和修補程式下載"
    }
    "out-deny-all-others" = {
      name                       = "out-deny-all-others"
      access                     = "Deny"
      source_address_prefix      = "VirtualNetwork"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_range     = "*"
      direction                  = "Outbound"
      priority                   = 4096
      protocol                   = "*"
      description                = "拒絕所有其他 outbound traffic"
    }
  }
}

module "nsg_azurebastionsubnet" {
  source              = "Azure/avm-res-network-networksecuritygroup/azurerm"
  version             = "0.5.0"
  enable_telemetry    = false
  resource_group_name = local.rg_vnet_sidecar_jpw_01.resource_group_name
  location            = local.rg_vnet_sidecar_jpw_01.location
  name                = "nsg-azurebastionsubnet"
  security_rules      = local.nsg_rules_azurebastionsubnet

  diagnostic_settings = {
    diag_logs = {
      name                           = "diag-logs"
      log_groups                     = ["allLogs"]
      log_analytics_destination_type = "Dedicated"
      workspace_resource_id          = local.sidecar_jpw_01.log_analytics_workspace_id
    }
  }
}