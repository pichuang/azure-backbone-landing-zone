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
  virtual_network_subnet_id               = module.vnet_apim_jpw_01.subnets["snet_apim"].resource_id
  virtual_network_type                    = "External"
  private_endpoints_manage_dns_zone_group = false
  # Availability Zones are only supported in the Premium tier.
  # zones                                   = ["1", "2", "3"] # for compliance with WAF
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
      enabled          = false
      consent_required = false
    }
  }
  tenant_access = {
    enabled = true
  }
  # 關閉下列較弱/過時的 Cipher, 保留 GCM + ECDHE 為主
  # 建議全部關閉這些舊版協定，只保留 TLS 1.2/1.3（APIM 內部預設支援）
  security = {
    enable_backend_ssl30                                = false
    enable_backend_tls10                                = false
    enable_backend_tls11                                = false
    enable_frontend_ssl30                               = false
    enable_frontend_tls10                               = false
    enable_frontend_tls11                               = false
    tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled = false
    tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled = false
    tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled   = false
    tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled   = false
    tls_rsa_with_aes128_cbc_sha256_ciphers_enabled      = false
    tls_rsa_with_aes128_cbc_sha_ciphers_enabled         = false
    tls_rsa_with_aes256_cbc_sha256_ciphers_enabled      = false
    tls_rsa_with_aes256_cbc_sha_ciphers_enabled         = false
    triple_des_ciphers_enabled                          = false
    tls_rsa_with_aes128_gcm_sha256_ciphers_enabled      = true
    tls_rsa_with_aes256_gcm_sha384_ciphers_enabled      = true
  }
}