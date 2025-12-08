# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_map

resource "azurerm_route_map" "routemap_bootstrp" {
  name           = "routemap-bootstrp"
  virtual_hub_id = azurerm_virtual_hub.vhub_azure_primary_prd_01.id
}
