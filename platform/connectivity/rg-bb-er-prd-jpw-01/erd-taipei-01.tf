# https://registry.terraform.io/modules/Azure/avm-res-keyvault-vault/azurerm/0.10.2
locals {
  erd_taipei_01 = {
    bandwidth_in_gbps = 10
    encapsulation     = "Dot1Q"
    erd_port_name     = "erd-taipei-01"
    peering_location  = "Taipei"
    admin_enabled     = false # 要用的時候請設定成 true
  }

  erc_m365_y_taipei_01 = {
    name              = "erc-m365-y-taipei-01"
    bandwidth_in_gbps = 10
  }

  erc_azure_y_taipei_01 = {
    name              = "erc-azure-y-taipei-01"
    bandwidth_in_gbps = 5
  }

  erc_azure_z_taipei_01 = {
    name              = "erc-azure-z-taipei-01"
    bandwidth_in_gbps = 5
  }

  key_ergw_taipei_01 = {
    name = "key-ergw-taipei-01"
  }
}

# https://registry.terraform.io/modules/Azure/avm-res-keyvault-vault/azurerm/latest
# https://learn.microsoft.com/zh-tw/azure/expressroute/expressroute-howto-macsec#create-azure-key-vault-macsec-secrets-and-user-identity
# 建立連線關聯金鑰 (CAK) 和連線關聯金鑰名稱 (CKN)，並將兩者儲存在 Key Vault 中
# module "key_erd_taipei_01" {
#   source  = "Azure/avm-res-keyvault-vault/azurerm"
#   version = "0.10.2"

#   location                        = azurerm_resource_group.rg_er_taipei01_prd_jpw_01.location
#   name                            = local.key_ergw_taipei_01.name
#   resource_group_name             = azurerm_resource_group.rg_er_taipei01_prd_jpw_01.name
#   tenant_id                       = var.tenant_id
#   sku_name                        = "premium"
#   enable_telemetry                = false
#   public_network_access_enabled   = true
#   enabled_for_deployment          = false
#   enabled_for_disk_encryption     = false
#   enabled_for_template_deployment = false
#   legacy_access_policies_enabled  = false
#   purge_protection_enabled        = false # 暫時關閉
#   soft_delete_retention_days      = 7
# }

# # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/express_route_port
# resource "azurerm_express_route_port" "erd_taipei_01" {
#   bandwidth_in_gbps   = local.erd_taipei_01.bandwidth_in_gbps
#   encapsulation       = local.erd_taipei_01.encapsulation
#   location            = azurerm_resource_group.rg_er_taipei01_prd_jpw_01.location
#   name                = local.erd_taipei_01.erd_port_name
#   peering_location    = local.erd_taipei_01.peering_location
#   resource_group_name = azurerm_resource_group.rg_er_taipei01_prd_jpw_01.name
#   billing_type        = "UnlimitedData"

#   identity {
#     type         = "UserAssigned"
#     identity_ids = "" # TODO
#   }

#   link1 {
#     admin_enabled                 = local.erd_taipei_01.admin_enabled
#     macsec_cipher                 = "GcmAes256"
#     macsec_sci_enabled            = true
#     macsec_ckn_keyvault_secret_id = "" # TODO
#     macsec_cak_keyvault_secret_id = "" # TODO
#   }
#   link2 {
#     admin_enabled                 = local.erd_taipei_01.admin_enabled
#     macsec_cipher                 = "GcmAes256"
#     macsec_sci_enabled            = true
#     macsec_ckn_keyvault_secret_id = "" # TODO
#     macsec_cak_keyvault_secret_id = "" # TODO
#   }
# }

# # erc_m365_y_taipei_01
# module "avm-res-network-expressroutecircuit" {
#   source           = "Azure/avm-res-network-expressroutecircuit/azurerm"
#   version          = "0.3.3"
#   enable_telemetry = false

#   location                       = azurerm_resource_group.rg_er_taipei01_prd_jpw_01.location
#   name                           = local.erc_m365_y_taipei_01.name
#   resource_group_name            = azurerm_resource_group.rg_er_taipei01_prd_jpw_01.name
#   bandwidth_in_gbps              = local.erc_m365_y_taipei_01.bandwidth_in_gbps
#   express_route_port_resource_id = azurerm_express_route_port.erd_taipei_01.id
#   sku = {
#     tier   = "Premium"
#     family = "UnlimitedData"
#   }
# }

# # erc_azure_y_taipei_01
# module "avm-res-network-expressroutecircuit" {
#   source           = "Azure/avm-res-network-expressroutecircuit/azurerm"
#   version          = "0.3.3"
#   enable_telemetry = false

#   location                       = azurerm_resource_group.rg_er_taipei01_prd_jpw_01.location
#   name                           = local.erc_azure_y_taipei_01.name
#   resource_group_name            = azurerm_resource_group.rg_er_taipei01_prd_jpw_01.name
#   bandwidth_in_gbps              = local.erc_azure_y_taipei_01.bandwidth_in_gbps
#   express_route_port_resource_id = azurerm_express_route_port.erd_taipei_01.id
#   sku = {
#     tier   = "Premium"
#     family = "UnlimitedData"
#   }
# }

# # erc_azure_z_taipei_01
# module "avm-res-network-expressroutecircuit" {
#   source           = "Azure/avm-res-network-expressroutecircuit/azurerm"
#   version          = "0.3.3"
#   enable_telemetry = false

#   location                       = azurerm_resource_group.rg_er_taipei01_prd_jpw_01.location
#   name                           = local.erc_azure_z_taipei_01.name
#   resource_group_name            = azurerm_resource_group.rg_er_taipei01_prd_jpw_01.name
#   bandwidth_in_gbps              = local.erc_azure_z_taipei_01.bandwidth_in_gbps
#   express_route_port_resource_id = azurerm_express_route_port.erd_taipei_01.id
#   sku = {
#     tier   = "Premium"
#     family = "UnlimitedData"
#   }
# }