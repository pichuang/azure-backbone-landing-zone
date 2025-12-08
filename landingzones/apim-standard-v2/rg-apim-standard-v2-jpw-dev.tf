resource "azurerm_resource_group" "rg_apim_standard_v2_jpw_dev" {
  location = var.secondary_location
  name     = "rg-apim-standard-v2-jpw-dev"
}
