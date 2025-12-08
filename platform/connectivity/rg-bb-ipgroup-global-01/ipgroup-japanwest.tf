module "ipg_vhub_azure_jpw_prd" {
  source           = "Azure/avm-res-network-ipgroup/azurerm"
  version          = "0.1.0"
  enable_telemetry = false

  resource_group_name = azurerm_resource_group.rg_ipgroup_global_01.name
  location            = azurerm_resource_group.rg_ipgroup_global_01.location
  name                = "ipg-vhub-azure-jpw-prd"
  ip_addresses = [
    "10.27.0.0/24",
    "10.27.1.0/24"
  ]
  tags = {
    地理區域 = "jpw"
    環境   = "prd"
  }
}

module "ipg_vnet_bastion_jpw_prd" {
  source           = "Azure/avm-res-network-ipgroup/azurerm"
  version          = "0.1.0"
  enable_telemetry = false

  resource_group_name = azurerm_resource_group.rg_ipgroup_global_01.name
  location            = azurerm_resource_group.rg_ipgroup_global_01.location
  name                = "ipg-vnet-bastion-jpw-prd"
  ip_addresses = [
    "10.27.3.0/24",
  ]
  tags = {
    地理區域 = "jpw"
    環境   = "prd"
  }
}

module "ipg_vnet_avd_jpw_prd" {
  source           = "Azure/avm-res-network-ipgroup/azurerm"
  version          = "0.1.0"
  enable_telemetry = false

  resource_group_name = azurerm_resource_group.rg_ipgroup_global_01.name
  location            = azurerm_resource_group.rg_ipgroup_global_01.location
  name                = "ipg-vnet-avd-jpw-prd"
  ip_addresses = [
    "10.27.4.0/24",
    "10.27.5.0/24",
  ]
  tags = {
    地理區域 = "jpw"
    環境   = "prd"
  }
}

module "ipg_vnet_sidecar_jpw_prd" {
  source           = "Azure/avm-res-network-ipgroup/azurerm"
  version          = "0.1.0"
  enable_telemetry = false

  resource_group_name = azurerm_resource_group.rg_ipgroup_global_01.name
  location            = azurerm_resource_group.rg_ipgroup_global_01.location
  name                = "ipg-vnet-sidecar-jpw-prd"
  ip_addresses = [
    "10.27.2.0/24",
    "10.27.6.0/24"
  ]
  tags = {
    地理區域 = "jpw"
    環境   = "prd"
  }
}

module "ipg_vnet_identity_jpw_prd" {
  source           = "Azure/avm-res-network-ipgroup/azurerm"
  version          = "0.1.0"
  enable_telemetry = false

  resource_group_name = azurerm_resource_group.rg_ipgroup_global_01.name
  location            = azurerm_resource_group.rg_ipgroup_global_01.location
  name                = "ipg-vnet-identity-jpw-prd"
  ip_addresses = [
    "10.27.7.0/24"
  ]
  tags = {
    地理區域 = "jpw"
    環境   = "prd"
  }
}

