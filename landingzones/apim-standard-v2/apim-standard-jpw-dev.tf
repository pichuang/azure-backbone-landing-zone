module "pip_apim_standard_v2_jpw_dev" {
  source           = "Azure/avm-res-network-publicipaddress/azurerm"
  version          = "0.2.0"
  enable_telemetry = false

  resource_group_name     = azurerm_resource_group.rg_apim_standard_v2_jpw_dev.name
  name                    = "pip-apim-standard-v2-jpw-dev"
  location                = azurerm_resource_group.rg_apim_standard_v2_jpw_dev.location
  allocation_method       = "Static"
  sku                     = "Standard"
  sku_tier                = "Regional"
  zones                   = ["1", "2", "3"] # for compliance with WAF
  ip_version              = "IPv4"
  idle_timeout_in_minutes = 4
}

module "vnet_apim_jpw_01" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.16.0"

  location         = azurerm_resource_group.rg_vnet_apim_jpw_01.location
  parent_id        = azurerm_resource_group.rg_vnet_apim_jpw_01.id
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

  diagnostic_settings = {
    diag_logs = {
      name                           = "diag-logs"
      workspace_resource_id          = var.log_soc_prd_jpw_01_workspace_id
      log_analytics_destination_type = "Dedicated" # Dedicated 就是 AzureDiagnostics
      log_groups                     = ["allLogs"]
    }
    diag_metrics = {
      name                           = "diag-metrics"
      workspace_resource_id          = var.log_soc_prd_jpw_01_workspace_id
      log_analytics_destination_type = "Dedicated" # Dedicated 就是 AzureDiagnostics
      metric_categories              = ["AllMetrics"]
    }
  }

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

module "apim_standard_v2_jpw_dev" {
  source           = "Azure/avm-res-apimanagement-service/azurerm"
  version          = "0.0.5"
  enable_telemetry = false

  name                = "apim-standard-v2-jpw-dev"
  resource_group_name = azurerm_resource_group.rg_apim_standard_v2_jpw_dev.name
  location            = azurerm_resource_group.rg_apim_standard_v2_jpw_dev.location

  sku_name                                = "StandardV2_1"
  publisher_name                          = "Backbone Publisher"
  publisher_email                         = "phil.huang@microsoft.com"
  gateway_disabled                        = false
  public_network_access_enabled           = true
  public_ip_address_id                    = module.pip_apim_standard_v2_jpw_dev.resource_id
  virtual_network_subnet_id               = module.vnet_apim_jpw_01.subnets["snet_apim"].id
  private_endpoints_manage_dns_zone_group = false
  zones                                   = ["1", "2", "3"] # for compliance with WAF
  managed_identities = {
    system_assigned = true
  }
  protocols = {
    enable_http2 = true
  }
  sign_in = {
    enabled = false
  }
  sign_up = {
    enabled = false
    terms_of_service = {
      enabled = false
    }
  }
  tenant_access = {
    enabled = true
  }
  security = {
    enable_backend_ssl30                                = true
    enable_backend_tls10                                = false
    enable_backend_tls11                                = false
    enable_frontend_ssl30                               = true
    enable_frontend_tls10                               = false
    enable_frontend_tls11                               = false
    tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled = true
    tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled = true
    tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled   = true
    tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled   = true
    tls_rsa_with_aes128_cbc_sha256_ciphers_enabled      = true
    tls_rsa_with_aes128_cbc_sha_ciphers_enabled         = true
    tls_rsa_with_aes128_gcm_sha256_ciphers_enabled      = true
    tls_rsa_with_aes256_gcm_sha384_ciphers_enabled      = true
    tls_rsa_with_aes256_cbc_sha256_ciphers_enabled      = true
    tls_rsa_with_aes256_cbc_sha_ciphers_enabled         = true
    triple_des_ciphers_enabled                          = true
  }
}