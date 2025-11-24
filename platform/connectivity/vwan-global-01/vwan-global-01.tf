#
# 定義 Virtual WAN 資源
# 包含 Resource Group 及 Virtual WAN 本體
# 因這個資源是隸屬全球資源, 並沒有特別實體綁區域, 所以名稱為 vwan-global-01
#

locals {
  vwan_global_01 = {
    name     = "vwan-global-01"
    location = "japanwest"
  }
}

resource "azurerm_resource_group" "rg_vwan_global_01" {
  name     = "rg-${local.vwan_global_01.name}"
  location = local.vwan_global_01.location
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_wan
resource "azurerm_virtual_wan" "vwan_global_01" {
  name                = local.vwan_global_01.name
  resource_group_name = azurerm_resource_group.rg_vwan_global_01.name
  location            = azurerm_resource_group.rg_vwan_global_01.location

  disable_vpn_encryption            = false
  allow_branch_to_branch_traffic    = true
  office365_local_breakout_category = "None"
  type                              = "Standard"
  tags                              = local.tags_connectivity
}