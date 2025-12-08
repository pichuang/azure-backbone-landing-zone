
resource "azurerm_resource_group" "rg_vwan_prd_global_01" {
  name     = local.vwan_prd_global_01.resource_group_name
  location = local.vwan_prd_global_01.location
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_wan
resource "azurerm_virtual_wan" "vwan_prd_global_01" {
  name                = local.vwan_prd_global_01.name
  resource_group_name = azurerm_resource_group.rg_vwan_prd_global_01.name
  location            = azurerm_resource_group.rg_vwan_prd_global_01.location

  disable_vpn_encryption            = false
  allow_branch_to_branch_traffic    = true
  office365_local_breakout_category = "None"
  type                              = "Standard"
  tags                              = local.vwan_prd_global_01.tags_connectivity
}