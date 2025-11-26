include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "."
}

dependency "vnet_sidecar_prd_jpw_01" {
  config_path = "../rg-bb-sidecar-prd-jpw-01"

  mock_outputs = {
    vnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworks/mock-vnet"
  }
  mock_outputs_allowed_terraform_commands    = ["init", "output", "validate", "plan"]
  mock_outputs_merge_strategy_with_state     = "shallow"
}

inputs = {
  subscription_id  = include.root.locals.merged_global_vars.subscription_connectivity_id
  vnet_sidecar_jpw_01_id = dependency.vnet_sidecar_prd_jpw_01.outputs.vnet_id
}
