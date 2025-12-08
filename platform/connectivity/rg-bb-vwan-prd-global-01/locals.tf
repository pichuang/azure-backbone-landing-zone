locals {

  vwan_prd_global_01 = {
    name                = "vwan-prd-global-01"
    resource_group_name = "rg-bb-vwan-prd-global-01"
    location            = var.primary_location
    tags_connectivity = {
      負責單位 = "網路團隊"
      環境   = "prd"
    }
  }
}