locals {
  bastionhost_prd_jpw_01 = {
    name                       = "bastion-prd-jpw-01"
    resource_group_name        = "rg-bb-bastion-prd-jpw-01"
    location                   = var.primary_location
    scale_units                = 2 # 2 ~ 50
    subnet_id                  = var.snet_azurebastionsubnet_id
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }
}