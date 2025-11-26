# https://registry.terraform.io/modules/Azure/avm-res-keyvault-vault/azurerm/0.10.2
locals {
  key_ergw_taipei_02 = {
    name = "key-ergw-taipei-02"
  }
}

# https://registry.terraform.io/modules/Azure/avm-res-keyvault-vault/azurerm/latest
module "key_erd_taipei_02" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.10.2"

  location                        = azurerm_resource_group.rg_kv_prd_jpw_01.location
  name                            = local.key_ergw_taipei_02.name
  resource_group_name             = azurerm_resource_group.rg_kv_prd_jpw_01.name
  tenant_id                       = var.tenant_id
  sku_name                        = "premium"
  enable_telemetry                = false
  public_network_access_enabled   = false
  enabled_for_deployment          = false
  enabled_for_disk_encryption     = false
  enabled_for_template_deployment = false
  legacy_access_policies_enabled  = false
  purge_protection_enabled        = false # 暫時關閉
  soft_delete_retention_days      = 7

  private_endpoints = {
    primary = {
      private_dns_zone_resource_ids = [var.privatelink_vaultcore_azure_net_id]
      subnet_resource_id            = var.private_endpoint_subnet_id
    }
  }

}