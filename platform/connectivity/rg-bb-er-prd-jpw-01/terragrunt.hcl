skip = true # 暫時忽略

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "."
}

inputs = {
  subscription_id           = include.root.locals.merged_global_vars.subscription_connectivity_id
  tenant_id                 = include.root.locals.merged_global_vars.tenant_id
  privatelink_vaultcore_azure_net_id = dependency.privatelink_vaultcore_azure_net_id.outputs.privatelink_vaultcore_azure_net_id
  private_endpoint_subnet_id = dependency.sidecar_prd_jpw_01.outputs.snet_kv_id
}
