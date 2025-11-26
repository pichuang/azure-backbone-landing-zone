include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "."
}

# 定義依賴關係
dependency "security_log_soc_prd_jpw_01" {
  config_path = "../../security/rg-bb-log-soc-prd-jpw-01" # 指向 security/rg-bb-log-soc-prd-jpw-01 的相對路徑

  # (選用) 設定 mock_outputs，這在尚未部署 log-soc-prd-jpw-01 就要跑 plan 時很重要
  mock_outputs = {
    log_soc_prd_jpw_01_workspace_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.OperationalInsights/workspaces/mock-log-soc-prd-jpw-01"
  }
  mock_outputs_allowed_terraform_commands    = ["init", "output", "validate", "plan"]
  mock_outputs_merge_strategy_with_state     = "shallow"
}

dependency "firewall_policies_id" {
  config_path = "../rg-bb-afwp-prd-global-01" # 依賴同層級 connectivity/rg-bb-afwp-prd-global-01 的 terragrunt 設定

  # (選用) 設定 mock_outputs，這在尚未部署 log-soc-prd-jpw-01 就要跑 plan 時很重要
  mock_outputs = {
    afwp_azure_jpw_prod_01_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.Network/firewallPolicies/mock-afwp-azure-jpw-prod-01"
  }
  mock_outputs_allowed_terraform_commands    = ["init", "output", "validate", "plan"]
  mock_outputs_merge_strategy_with_state     = "shallow"
}


inputs = {
  subscription_id  = include.root.locals.merged_global_vars.subscription_connectivity_id
  log_soc_prd_jpw_01_workspace_id = dependency.security_log_soc_prd_jpw_01.outputs.log_soc_prd_jpw_01_workspace_id
  afwp_azure_jpw_prod_01_id       = dependency.firewall_policies_id.outputs.afwp_azure_jpw_prod_01_id
}
