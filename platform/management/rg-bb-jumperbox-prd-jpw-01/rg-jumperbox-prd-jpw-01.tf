resource "azurerm_resource_group" "rg_jumperbox_prd_jpw_01" {
  name     = local.jumperbox_prd_jpw_01.resource_group_name
  location = local.jumperbox_prd_jpw_01.location
}
