locals {
  network_protection_prd_global_01 = {
    name                = "network-protection-prd-global-01"
    resource_group_name = "rg-bb-network-protection-prd-global-01"
    location            = "japanwest"
  }
}

resource "azurerm_resource_group" "rg_network_protection_prd_global_01" {
  name     = local.network_protection_prd_global_01.resource_group_name
  location = local.network_protection_prd_global_01.location
}

# module "network_protection_prd_global_01" {
#   source  = "Azure/avm-res-network-ddosprotectionplan/azurerm//examples/default-azurerm-v4"
#   version = "0.3.0"
#   enable_telemetry = false
#   name = local.network_protection_prd_global_01.name
#   resource_group_name = azurerm_resource_group.rg_network_protection_prd_global_01.name
#   location            = azurerm_resource_group.rg_network_protection_prd_global_01.location
# }