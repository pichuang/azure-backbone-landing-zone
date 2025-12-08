resource "azurerm_resource_group" "rg_apim_standard_v2_jpw_dev" {
  location = var.primary_location
  name     = "rg-apim-standardv2-jpw-dev"
}
