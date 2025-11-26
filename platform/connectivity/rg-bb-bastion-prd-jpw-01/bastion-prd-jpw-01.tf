# https://registry.terraform.io/modules/Azure/avm-res-network-bastionhost/azurerm/latest


locals {
  bastionhost_prd_jpw_01 = {
    name                       = "bastion-prd-jpw-01"
    resource_group_name        = "rg-bb-bastion-prd-jpw-01"
    location                   = "japanwest"
    scale_units                = 2 # 2 ~ 50
    subnet_id                  = var.snet_azurebastionsubnet_id
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }
}

resource "azurerm_resource_group" "rg_bb_bastion_prd_jpw_01" {
  location = local.bastionhost_prd_jpw_01.location
  name     = local.bastionhost_prd_jpw_01.resource_group_name
}

# https://registry.terraform.io/modules/Azure/avm-res-network-bastionhost/azurerm/latest?tab=inputs
module "bastionhost_prd_jpw_01" {
  source           = "Azure/avm-res-network-bastionhost/azurerm"
  version          = "0.9.0"
  enable_telemetry = false

  location  = local.bastionhost_prd_jpw_01.location
  name      = local.bastionhost_prd_jpw_01.name
  parent_id = azurerm_resource_group.rg_bb_bastion_prd_jpw_01.id

  ip_configuration = {
    name             = "privateip-bastion-prd-jpw-01"
    subnet_id        = local.bastionhost_prd_jpw_01.subnet_id
    create_public_ip = false
  }

  copy_paste_enabled        = true
  file_copy_enabled         = true
  ip_connect_enabled        = true
  kerberos_enabled          = true
  private_only_enabled      = true
  scale_units               = local.bastionhost_prd_jpw_01.scale_units
  session_recording_enabled = true
  shareable_link_enabled    = true
  sku                       = "Premium"
  zones                     = ["1", "2", "3"]
  # Tunneling functionality is not compatible with session recording functionality.
  tunneling_enabled = false

  diagnostic_settings = {
    diag_logs = {
      name                           = "diag-logs"
      workspace_resource_id          = local.bastionhost_prd_jpw_01.log_analytics_workspace_id
      log_analytics_destination_type = "AzureDiagnostics"
      log_groups                     = ["allLogs"]
      metric_categories              = ["AllMetrics"]
    }
  }
}