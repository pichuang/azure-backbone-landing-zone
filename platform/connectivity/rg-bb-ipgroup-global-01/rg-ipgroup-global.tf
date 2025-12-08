resource "azurerm_resource_group" "rg_ipgroup_global_01" {
  name     = local.ipgroup_global.resource_group_name
  location = local.ipgroup_global.location
}