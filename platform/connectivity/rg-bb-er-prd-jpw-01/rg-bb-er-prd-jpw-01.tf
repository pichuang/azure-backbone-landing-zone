# https://registry.terraform.io/modules/Azure/avm-res-keyvault-vault/azurerm/0.10.2
locals {
  er_prd_jpw_01 = {
    resource_group_name = "rg-bb-er-prd-jpw-01"
    location            = "japanwest"
  }
}

resource "azurerm_resource_group" "rg_er_taipei01_prd_jpw_01" {
  location = local.er_prd_jpw_01.location
  name     = local.er_prd_jpw_01.resource_group_name
}