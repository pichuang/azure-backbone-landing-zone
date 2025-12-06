#!/bin/bash
# XXX
set -xeuo pipefail

# 使用 Local State
export TG_LOCAL_STATE=true
export TF_VAR_use_msi=false
export TF_VAR_use_cli=true

TARGET_DIR=""

if [[ -z "${1:-}" || "$1" == "0" ]]; then
  echo "請提供要執行的目錄路徑，範例：platform/connectivity/rg-bb-vwan-prd-global-01"
  exit 1
fi

TARGET_DIR="$1"

# 在目標目錄中執行 Terragrunt 指令
(
  cd "$TARGET_DIR"

  # 使用 Terragrunt 執行特定目錄的 Terraform Plan
  terragrunt plan

  # 使用 Terragrunt 執行特定目錄的 Terraform Apply
  terragrunt apply
)
