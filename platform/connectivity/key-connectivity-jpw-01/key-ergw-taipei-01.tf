# https://registry.terraform.io/modules/Azure/avm-res-keyvault-vault/azurerm/0.10.2
locals {
  key_connectivity_jpw_01 = {
    name     = "key-connectivity-jpw-01"
    location = "japanwest"
  }

  vnet_connectivity_jpw_01 = {
    resource_group_name  = "rg-connectivity-jpw-01"
    virtual_network_name = "vnet-connectivity-jpw-01"
    subnet_name          = "snet-private-endpoints-jpw"
  }

  private_dns_zone = {
    resource_group_name = "rg-private-dns-zones-global"
    vaultcore_zone_name = "privatelink.vaultcore.azure.net"
  }
}

resource "azurerm_resource_group" "rg_key_connectivity_jpw_01" {
  location = local.key_connectivity_jpw_01.location
  name     = "rg-${local.key_connectivity_jpw_01.name}"
}

# 依賴反轉（Dependency Inversion）
# 在使用 Data Sources 時，使用者不再關心生產者的 Terraform 程式碼或狀態文件在哪裡，甚至不關心資源是否是由 Terraform 建立的（它可能是由 CLI、Portal 或 Bicep 建立的）。使用者只關心：「Azure 上是否存在一個滿足需求的資源？」
data "azurerm_private_dns_zone" "privatelink_vaultcore_azure_net" {
  name                = local.private_dns_zone.vaultcore_zone_name
  resource_group_name = local.private_dns_zone.resource_group_name
}

data "azurerm_subnet" "snet_private_endpoints_jpw" {
  name                 = local.vnet_connectivity_jpw_01.subnet_name
  resource_group_name  = local.vnet_connectivity_jpw_01.resource_group_name
  virtual_network_name = local.vnet_connectivity_jpw_01.virtual_network_name
}

# https://registry.terraform.io/modules/Azure/avm-res-keyvault-vault/azurerm/latest
module "key_erd_taipei_01" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.10.2"

  location                        = local.key_connectivity_jpw_01.location
  name                            = "key-erd-taipei-01"
  resource_group_name             = azurerm_resource_group.rg_key_connectivity_jpw_01.name
  tenant_id                       = var.tenant_id
  sku_name                        = "premium"
  enable_telemetry                = false
  public_network_access_enabled   = false
  enabled_for_deployment          = false
  enabled_for_disk_encryption     = false
  enabled_for_template_deployment = false
  legacy_access_policies_enabled  = false
  purge_protection_enabled        = true
  soft_delete_retention_days      = 7

  private_endpoints = {
    primary = {
      private_dns_zone_resource_ids = [data.azurerm_private_dns_zone.privatelink_vaultcore_azure_net.id]
      subnet_resource_id            = data.azurerm_subnet.snet_private_endpoints_jpw.id
    }
  }

}