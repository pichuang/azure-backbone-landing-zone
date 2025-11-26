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
  mock_outputs_allowed_terraform_commands = ["output", "validate", "plan"]
}

inputs = {
  subscription_id                = include.root.locals.merged_global_vars.subscription_connectivity_id
  log_soc_prd_jpw_01_workspace_id = dependency.security_log_soc_prd_jpw_01.outputs.log_soc_prd_jpw_01_workspace_id
}
