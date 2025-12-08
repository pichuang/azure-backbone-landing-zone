locals {
  # https://learn.microsoft.com/zh-tw/azure/api-management/api-management-using-with-vnet
  nsg_rules_apim_standard_v2 = {
    # Inbound
    "in-allow-apigateway" = {
      name                       = "in-allow-apigateway"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      source_address_prefix      = "Internet"
      source_port_range          = "*"
      destination_address_prefix = "VirtualNetwork"
      destination_port_ranges    = ["443"]
      protocol                   = "Tcp"
      description                = "與 API 管理的用戶端通訊"
    }
    "in-allow-apimcommunication" = {
      name                       = "in-allow-apimcommunication"
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Allow"
      source_address_prefix      = "ApiManagement"
      source_port_range          = "*"
      destination_address_prefix = "VirtualNetwork"
      destination_port_ranges    = ["3443"]
      protocol                   = "Tcp"
      description                = "Azure 入口網站和 PowerShell 的管理端點"
    }
    "in-allow-azlb-healthprobe" = {
      name                       = "in-allow-azlb-healthprobe"
      priority                   = 300
      direction                  = "Inbound"
      access                     = "Allow"
      source_address_prefix      = "AzureLoadBalancer"
      source_port_range          = "*"
      destination_address_prefix = "VirtualNetwork"
      destination_port_ranges    = ["6390"]
      protocol                   = "Tcp"
      description                = "Azure 基礎結構負載平衡器"
    }
    "in-allow-trafficmanager" = {
      name                       = "in-allow-trafficmanager"
      priority                   = 400
      direction                  = "Inbound"
      access                     = "Allow"
      source_address_prefix      = "AzureTrafficManager"
      source_port_range          = "*"
      destination_address_prefix = "VirtualNetwork"
      destination_port_range     = "443"
      protocol                   = "Tcp"
      description                = "多區域部署的 Azure 流量管理員路由"
    }
    "in-deny-all" = {
      name                       = "in-deny-all"
      priority                   = 4096
      direction                  = "Inbound"
      access                     = "Deny"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_range     = "*"
      protocol                   = "*"
      description                = "Deny all other inbound traffic"
    }

    # Outbound
    "out-allow-certificates" = {
      name                       = "out-allow-certificates"
      access                     = "Allow"
      direction                  = "Outbound"
      priority                   = 100
      source_address_prefix      = "VirtualNetwork"
      source_port_range          = "*"
      destination_address_prefix = "Internet"
      destination_port_ranges    = ["80"]
      protocol                   = "Tcp"
      description                = "Microsoft 受控和客戶自控憑證的驗證和管理"
    }
    "out-allow-storage" = {
      name                       = "out-allow-storage"
      access                     = "Allow"
      direction                  = "Outbound"
      priority                   = 200
      source_address_prefix      = "VirtualNetwork"
      source_port_range          = "*"
      destination_address_prefix = "Storage"
      destination_port_ranges    = ["443"]
      protocol                   = "Tcp"
      description                = "核心服務功能的 Azure Storage 相依性"
    }
    "out-allow-sql" = {
      name                       = "out-allow-sql"
      access                     = "Allow"
      direction                  = "Outbound"
      priority                   = 300
      source_address_prefix      = "VirtualNetwork"
      source_port_range          = "*"
      destination_address_prefix = "SQL"
      destination_port_ranges    = ["1433"]
      protocol                   = "Tcp"
      description                = "存取 Azure SQL 端點以取得核心服務功能"
    }
    "out-allow-kv" = {
      name                       = "out-allow-kv"
      access                     = "Allow"
      direction                  = "Outbound"
      priority                   = 400
      source_address_prefix      = "VirtualNetwork"
      source_port_range          = "*"
      destination_address_prefix = "AzureKeyVault"
      destination_port_ranges    = ["443"]
      protocol                   = "Tcp"
      description                = "存取 Azure Key Vault 端點以取得核心服務功能"
    }
    "out-allow-monitor" = {
      name                       = "out-allow-monitor"
      access                     = "Allow"
      direction                  = "Outbound"
      priority                   = 500
      source_address_prefix      = "VirtualNetwork"
      source_port_range          = "*"
      destination_address_prefix = "AzureMonitor"
      destination_port_ranges    = ["443", "1886"]
      protocol                   = "Tcp"
      description                = "發佈 診斷記錄和計量、 資源健康情況和 Application Insights"
    }
    "out-deny-all" = {
      name                       = "out-deny-all"
      access                     = "Deny"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_range     = "*"
      direction                  = "Outbound"
      priority                   = 4096
      protocol                   = "*"
      description                = "Deny all other outbound traffic"
    }
  }
}

module "nsg_apim_standard_v2" {
  source              = "Azure/avm-res-network-networksecuritygroup/azurerm"
  version             = "0.5.0"
  enable_telemetry    = false
  resource_group_name = azurerm_resource_group.rg_apim_standard_v2_jpw_dev.name
  location            = azurerm_resource_group.rg_apim_standard_v2_jpw_dev.location
  name                = "nsg-apim-standard-v2"
  security_rules      = local.nsg_rules_apim_standard_v2

  diagnostic_settings = {
    diag_logs = {
      name                           = "diag-logs"
      log_groups                     = ["allLogs"]
      log_analytics_destination_type = "Dedicated"
      workspace_resource_id          = var.log_soc_prd_jpw_01_workspace_id
    }
  }
}