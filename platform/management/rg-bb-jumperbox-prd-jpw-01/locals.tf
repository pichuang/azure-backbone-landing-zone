locals {
  jumperbox_prd_jpw_01 = {
    name                       = "jumperbox-prd-jpw-01"
    resource_group_name        = "rg-bb-jumperbox-prd-jpw-01"
    location                   = var.primary_location
    subnet_id                  = var.snet_jumperbox_id
    log_analytics_workspace_id = var.log_analytics_workspace_id
    sku = "Standard_DC16eds_v5"
  }
}