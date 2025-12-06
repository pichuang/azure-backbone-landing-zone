variable "primary_location" {
  description = "請填寫主要部署區域，例如：japanwest"
  type        = string
  default     = "japanwest"
}
resource "azurerm_resource_group" "rg_afwp_global_01" {
  name     = "rg-bb-afwp-global-01"
  location =
}