module "vnet_apim_jpw_01" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.16.0"

  location         = azurerm_resource_group.rg_apim_standard_v2_jpw_dev.location
  parent_id        = azurerm_resource_group.rg_apim_standard_v2_jpw_dev.id
  enable_telemetry = false

  address_space        = ["10.227.47.0/24"]
  name                 = "vnet-apim-standard-v2-jpw-dev"
  enable_vm_protection = true
  encryption = {
    enabled     = true
    enforcement = "AllowUnencrypted"
  }
  flow_timeout_in_minutes = 4
  dns_servers = {
    dns_servers = ["10.227.0.132"]
  }

  # diagnostic_settings = {
  #   diag_logs = {
  #     name                           = "diag-logs"
  #     workspace_resource_id          = var.log_soc_prd_jpw_01_workspace_id
  #     log_analytics_destination_type = "Dedicated" # Dedicated 就是 AzureDiagnostics
  #     log_groups                     = ["allLogs"]
  #   }
  #   diag_metrics = {
  #     name                           = "diag-metrics"
  #     workspace_resource_id          = var.log_soc_prd_jpw_01_workspace_id
  #     log_analytics_destination_type = "Dedicated" # Dedicated 就是 AzureDiagnostics
  #     metric_categories              = ["AllMetrics"]
  #   }
  # }

  subnets = {
    snet_apim = {
      name                                          = "snet-apim"
      address_prefixes                              = ["10.227.47.0/24"]
      default_outbound_access_enabled               = false
      private_endpoint_network_policies             = "Enabled"
      private_link_service_network_policies_enabled = true
      network_security_group = {
        id = module.nsg_apim_standard_v2.resource_id
      }
    }
  }
}