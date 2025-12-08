include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "."
}

dependency "privatelink_vaultcore_azure_net" {
  config_path = "../rg-bb-private-dns-zones-prd-global-01"

  mock_outputs = {
    privatelink_vaultcore_azure_net_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.Network/privateDnsZones/mock-privatelink"
  }
  mock_outputs_allowed_terraform_commands = ["output", "validate", "plan"]
}

dependency "sidecar_prd_jpw_01" {
  config_path = "../rg-bb-sidecar-prd-jpw-01"

  mock_outputs = {
    snet_kv_id = "/subscriptions/82c65997-b2ba-41ef-bf8a-80bc639ea78d/resourceGroups/rg-bb-sidecar-prd-jpw-01/providers/Microsoft.Network/virtualNetworks/vnet-sidecar-jpw-01/subnets/snet-kv"
  }
  mock_outputs_allowed_terraform_commands = ["init", "output", "validate", "plan", "apply"]
  mock_outputs_merge_strategy_with_state = "shallow"
}

inputs = {
  subscription_id           = include.root.locals.merged_global_vars.subscription_connectivity_id
  tenant_id                 = include.root.locals.merged_global_vars.tenant_id
  privatelink_vaultcore_azure_net_id = dependency.privatelink_vaultcore_azure_net.outputs.privatelink_vaultcore_azure_net_id
  private_endpoint_subnet_id = dependency.sidecar_prd_jpw_01.outputs.snet_kv_id
}
