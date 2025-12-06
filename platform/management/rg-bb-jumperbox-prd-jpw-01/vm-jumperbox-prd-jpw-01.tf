# https://registry.terraform.io/modules/Azure/avm-res-compute-virtualmachine/azurerm/latest?tab=resources

module "vm_jumperbox_prd_jpw_01" {
  source                     = "Azure/avm-res-compute-virtualmachine/azurerm"
  version                    = "0.20.0"
  enable_telemetry           = false
  encryption_at_host_enabled = false # TODO
  location                   = local.jumperbox_prd_jpw_01.location
  name                       = "vm-${local.jumperbox_prd_jpw_01.name}"
  resource_group_name        = local.jumperbox_prd_jpw_01.resource_group_name
  zone                       = 1
  os_type                    = "Windows"
  source_image_reference = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    # 支援熱修補 (Hot Patching)
    # https://learn.microsoft.com/zh-tw/azure/virtual-machines/automatic-vm-guest-patching#supported-windows-images-hotpatchable
    sku     = "2025-datacenter-azure-edition"
    version = "latest"
  }
  sku_size = local.jumperbox_prd_jpw_01.sku
  network_interfaces = {
    network_interfaces_1 = {
      name    = "nic-01-${local.jumperbox_prd_jpw_01.name}"
      primary = true
      ip_configurations = {
        ip_configuration_1 = {
          name                          = "ipconfig-01"
          subnet_id                     = var.snet_jumperbox_id
          private_ip_address_allocation = "Dynamic"
        }
      }
      diagnostic_settings = {
        diag_metrics = {
          name                  = "diag-metrics"
          workspace_resource_id = local.jumperbox_prd_jpw_01.log_analytics_workspace_id
          metric_categories     = ["AllMetrics"]
        }
      }
    }
  }
  extensions = {
    azure_monitor_agent = {
      name                       = "AzureMonitorWindowsAgent"
      publisher                  = "Microsoft.Azure.Monitor"
      type                       = "AzureMonitorWindowsAgent"
      type_handler_version       = "1.2"
      auto_upgrade_minor_version = true
      automatic_upgrade_enabled  = true
      settings                   = null
    }
    # azure_disk_encryption = {
    #   name                       = "AzureDiskEncryption"
    #   publisher                  = "Microsoft.Azure.Security"
    #   type                       = "AzureDiskEncryption"
    #   type_handler_version       = "2.2"
    #   auto_upgrade_minor_version = true
    #   settings                   = <<SETTINGS
    #       {
    #           "EncryptionOperation": "EnableEncryption",
    #           "KeyVaultURL": "${data.azurerm_key_vault.this.vault_uri}",
    #           "KeyVaultResourceId": "${module.avm_res_keyvault_vault.resource_id}",
    #           "KeyEncryptionAlgorithm": "RSA-OAEP",
    #           "VolumeType": "All"
    #       }
    #   SETTINGS
    # }
  }
}