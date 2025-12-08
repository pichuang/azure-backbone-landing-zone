module "ipg_vhub_azure_jpe_prd" {
  source           = "Azure/avm-res-network-ipgroup/azurerm"
  version          = "0.1.0"
  enable_telemetry = false

  resource_group_name = azurerm_resource_group.rg_ipgroup_global_01.name
  location            = azurerm_resource_group.rg_ipgroup_global_01.location
  name                = "ipg-vhub-azure-jpw-prd"
  ip_addresses = [
    "10.27.8.0/24",
    "10.27.9.0/24"
  ]
  tags = {
    地理區域 = "jpe"
    環境   = "prd"
  }
}

module "ipg_vnet_sidecar_jpe_prd" {
  source           = "Azure/avm-res-network-ipgroup/azurerm"
  version          = "0.1.0"
  enable_telemetry = false

  resource_group_name = azurerm_resource_group.rg_ipgroup_global_01.name
  location            = azurerm_resource_group.rg_ipgroup_global_01.location
  name                = "ipg-vnet-sidecar-jpe-prd"
  ip_addresses = [
    "10.27.10.0/24",
    "10.27.11.0/24"
  ]
  tags = {
    地理區域 = "jpe"
    環境   = "prd"
  }
}

module "ipg_vhub_m365_jpe_prd" {
  source           = "Azure/avm-res-network-ipgroup/azurerm"
  version          = "0.1.0"
  enable_telemetry = false

  resource_group_name = azurerm_resource_group.rg_ipgroup_global_01.name
  location            = azurerm_resource_group.rg_ipgroup_global_01.location
  name                = "ipg-vhub-m365-jpe-prd"
  ip_addresses = [
    "10.27.12.0/24",
    "10.27.13.0/24"
  ]
  tags = {
    地理區域 = "jpe"
    環境   = "m365"
  }
}

module "ipg_vnet_m365_jpe_prd" {
  source           = "Azure/avm-res-network-ipgroup/azurerm"
  version          = "0.1.0"
  enable_telemetry = false

  resource_group_name = azurerm_resource_group.rg_ipgroup_global_01.name
  location            = azurerm_resource_group.rg_ipgroup_global_01.location
  name                = "ipg-vnet-m365-jpe-prd"
  ip_addresses = [
    "10.27.14.0/24",
    "10.27.15.0/24"
  ]
  tags = {
    地理區域 = "jpe"
    環境   = "m365"
  }
}
