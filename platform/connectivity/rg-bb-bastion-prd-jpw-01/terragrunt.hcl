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
    snet_azurebastionsubnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworks/mock-vnet/subnets/mock-snet"
  }
  mock_outputs_allowed_terraform_commands    = ["init", "output", "validate", "plan"]
  mock_outputs_merge_strategy_with_state     = "shallow"
}

dependency "security_log_soc_prd_jpw_01" {
  config_path = "../../security/rg-bb-soc-prd-jpw-01"
  mock_outputs = {
    log_soc_prd_jpw_01_workspace_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.OperationalInsights/workspaces/mock-log-soc-prd-jpw-01"
  }
  mock_outputs_allowed_terraform_commands = ["output", "validate", "plan"]
}

inputs = {
  subscription_id                = include.root.locals.merged_global_vars.subscription_connectivity_id
  snet_azurebastionsubnet_id     = dependency.vnet_sidecar_prd_jpw_01.outputs.snet_azurebastionsubnet_id
  log_analytics_workspace_id      = dependency.security_log_soc_prd_jpw_01.outputs.log_soc_prd_jpw_01_workspace_id
  primary_location                = include.root.locals.merged_global_vars.primary_location
}
