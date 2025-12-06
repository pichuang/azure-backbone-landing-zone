# https://registry.terraform.io/modules/Azure/avm-res-network-networksecuritygroup
# https://learn.microsoft.com/zh-tw/azure/bastion/bastion-nsg
locals {
  nsg_rules_azurebastionsubnet = {
    #
    # Inbound
    #
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
    "in-allow-azureloadbalancer" = {
      name                       = "in-allow-azureloadbalancer"
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Allow"
      source_address_prefix      = "AzureLoadBalancer"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_ranges    = ["443"]
      protocol                   = "Tcp"
      description                = "用於 Azure Health Probe 健康檢查"
    }
    "in-allow-bastionhostcommunication" = {
      name                       = "in-allow-bastionhostcommunication"
      priority                   = 300
      direction                  = "Inbound"
      access                     = "Allow"
      source_address_prefix      = "VirtualNetwork"
      source_port_range          = "*"
      destination_address_prefix = "VirtualNetwork"
      destination_port_ranges    = ["8080", "5701"]
      protocol                   = "Tcp"
      description                = "用於 Azure Bastion Host 之間通訊。"
    }
    "in-allow-trust-networks" = {
      name                       = "in-allow-trust-networks"
      priority                   = 400
      direction                  = "Inbound"
      access                     = "Allow"
      source_address_prefix      = "10.0.0.0/8"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_ranges    = ["443"]
      protocol                   = "Tcp"
      description                = "允許來自信任網段流量"
    }
    "in-deny-all-others" = {
      name                       = "in-deny-all-others"
      access                     = "Deny"
      destination_address_prefix = "*"
      destination_port_range     = "*"
      direction                  = "Inbound"
      priority                   = 4096
      protocol                   = "*"
      source_address_prefix      = "*"
      source_port_range          = "*"
      description                = "拒絕所有其他 inbound traffic"
    }
    #
    # Outbound
    #
    "out-allow-jumperbox" = {
      name                       = "out-allow-jumperbox"
      access                     = "Allow"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "10.227.2.64/28" # snet-jumperbox
      destination_port_ranges    = ["22", "3389"]
      direction                  = "Outbound"
      priority                   = 100
      protocol                   = "Tcp"
      description                = "允許連線到 Jumperbox 子網路的 SSH 和 RDP 流量"
    }
    "out-allow-azurecloud" = {
      name                       = "out-allow-azurecloud"
      access                     = "Allow"
      destination_address_prefix = "AzureCloud.japanwest" # AzureCloud.<location>
      destination_port_ranges    = ["443"]
      direction                  = "Outbound"
      priority                   = 300
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      source_port_range          = "*"
      description                = "允許連線至 AzureCloud.${local.rg_vnet_sidecar_jpw_01.location} 進行更新和修補程式下載"
    }
    "out-allow-bastionhostcommunication" = {
      name                       = "out-allow-bastionhostcommunication"
      access                     = "Allow"
      destination_address_prefix = "VirtualNetwork"
      destination_port_ranges    = ["8080", "5701"]
      direction                  = "Outbound"
      priority                   = 200
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      source_port_range          = "*"
      description                = "允許 Azure Bastion Host 之間的 outbound 通訊"
    }
    "out-deny-all-others" = {
      name                       = "out-deny-all-others"
      access                     = "Deny"
      destination_address_prefix = "*"
      destination_port_range     = "*"
      direction                  = "Outbound"
      priority                   = 4096
      protocol                   = "*"
      source_address_prefix      = "*"
      source_port_range          = "*"
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
    diag_metrics = {
      name                           = "diag-metrics"
      metric_categories              = ["AllMetrics"]
      log_analytics_destination_type = "Dedicated"
      workspace_resource_id          = local.sidecar_jpw_01.log_analytics_workspace_id
    }
  }
}