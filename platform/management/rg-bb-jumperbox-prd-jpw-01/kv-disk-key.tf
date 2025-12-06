# # https://registry.terraform.io/modules/Azure/avm-res-keyvault-vault
# module "avm_res_keyvault_vault" {
#   source  = "Azure/avm-res-keyvault-vault/azurerm"
#   version = "0.10.2"

#   location                    = local.jumperbox_prd_jpw_01.location
#   name                        = "${module.naming.key_vault.name_unique}-win-eah"
#   resource_group_name         = local.jumperbox_prd_jpw_01.resource_group_name
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   enabled_for_disk_encryption = true
#   keys = {
#     des_key = {
#       name     = "des-disk-key"
#       key_type = "RSA"
#       key_size = 2048

#       key_opts = [
#         "decrypt",
#         "encrypt",
#         "sign",
#         "unwrapKey",
#         "verify",
#         "wrapKey",
#       ]
#     }
#   }
#   network_acls = {
#     default_action = "Allow"
#     bypass         = "AzureServices"
#   }
#   role_assignments = {
#     deployment_user_secrets = { #give the deployment user access to secrets
#       role_definition_id_or_name = "Key Vault Secrets Officer"
#       principal_id               = data.azurerm_client_config.current.object_id
#     }
#     deployment_user_keys = { #give the deployment user access to keys
#       role_definition_id_or_name = "Key Vault Crypto Officer"
#       principal_id               = data.azurerm_client_config.current.object_id
#     }
#     user_managed_identity_keys = { #give the user assigned managed identity for the disk encryption set access to keys
#       role_definition_id_or_name = "Key Vault Crypto Officer"
#       principal_id               = azurerm_user_assigned_identity.test.principal_id
#       principal_type             = "ServicePrincipal"
#     }
#   }
#   wait_for_rbac_before_key_operations = {
#     create = "60s"
#   }
#   wait_for_rbac_before_secret_operations = {
#     create = "60s"
#   }
# }
