# TERRAGRUNT CONFIGURATION
# 定義全域行為 (Backend, Provider Generator)

locals {
  # 讀取環境變數，預設為 false (使用 Remote State)
  use_local_state = get_env("TG_LOCAL_STATE", "false") == "true"

  # 讀取全域變數
  global_vars = read_terragrunt_config(find_in_parent_folders("global.prod.hcl", "global.prod.hcl"))

  # 讀取本地覆寫變數 (如果存在 global.local-dev.hcl 則讀取，否則讀取 global.prod.hcl 作為 fallback)
  # 使用 nested find_in_parent_folders 確保 fallback 路徑是絕對路徑且有效的
  global_local_vars = read_terragrunt_config(find_in_parent_folders("global.local-dev.hcl", find_in_parent_folders("global.prod.hcl", "global.prod.hcl")))

  # 合併變數 (Local 覆蓋 Global)
  merged_global_vars = merge(local.global_vars.locals, local.global_local_vars.locals)
}

# 將全域變數注入到 Terraform 變數中
inputs = merge(
  local.merged_global_vars,
  {
    # 預設 Subscription ID (讓根目錄可執行，子模組會覆寫此值)
    subscription_id                = "00000000-0000-0000-0000-000000000000"
  }
)

# 1. 動態生成 Backend 配置 (DRY 原則：只需定義一次)
remote_state {

  # 根據變數決定 Backend 類型
  backend = local.use_local_state ? "local" : "azurerm"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = local.use_local_state ? {

    # [開發模式] 使用本地檔案
    # get_original_terragrunt_dir() 確保 state 檔案存放在專案目錄下，而非 cache 目錄
    path = "${get_original_terragrunt_dir()}/terraform.tfstate"
  } : {

    # [正式模式] 使用 Azure Storage
    # 需要放在 devsecops subscription
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformstateprod"
    container_name       = "tfstate"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
    subscription_id      = local.merged_global_vars.subscription_devsecops_id
  }
}

# 動態生成 Provider 配置
# 如果需要生成全專案都要使用的 provider.tf 檔案，可以在這裡定義
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
}
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    key_vault {
      # 讓 Terraform 自動復原軟刪除的 Key Vault
      recover_soft_deleted_key_vaults = true
    }
  }
  storage_use_azuread = true
  # 動態讀取子目錄中的 Subscription ID
  subscription_id = var.subscription_id
  use_msi = true
}
EOF
}