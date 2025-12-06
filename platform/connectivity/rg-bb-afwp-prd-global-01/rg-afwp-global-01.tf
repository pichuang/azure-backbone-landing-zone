resource "azurerm_resource_group" "rg_afwp_global_01" {
  name     = "rg-bb-afwp-global-01"
  location = var.primary_location
}