resource "azurerm_resource_group" "rg_avnm_prd_jpw_01" {
  name     = local.rg_avnm_prd_jpw_01.resource_group_name
  location = local.rg_avnm_prd_jpw_01.location
}
