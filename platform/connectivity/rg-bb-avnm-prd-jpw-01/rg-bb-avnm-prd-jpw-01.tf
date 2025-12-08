locals {
  rg_avnm_prd_jpw_01 = {
    location            = var.primary_location
    resource_group_name = "rg-bb-avnm-prd-jpw-01"
  }
}

resource "azurerm_resource_group" "rg_avnm_prd_jpw_01" {
  name     = local.rg_avnm_prd_jpw_01.resource_group_name
  location = local.rg_avnm_prd_jpw_01.location
}
