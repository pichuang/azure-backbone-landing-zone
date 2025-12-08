#!/bin/bash

# 使用 Local State
export TG_LOCAL_STATE=true
export TF_VAR_use_msi=false
export TF_VAR_use_cli=true

# 格式化 Terraform 配置文件
terragrunt run -- fmt --recursive

# # 初始化 Terraform Modules
# terragrunt run --all init

# # 使用 Terragrunt 執行全部 Terraform Plan
# terragrunt run --all plan

# 使用 Terragrunt 執行全部 Terraform Apply
terragrunt run --all apply
