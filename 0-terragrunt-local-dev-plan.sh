#!/bin/bash

# 使用 Local State
export TG_LOCAL_STATE=true
export ARM_USE_MSI=true
export ARM_CLIENT_ID="${mi_client_id}"

# 格式化 Terraform 配置文件
terragrunt run -- fmt --recursive

# 初始化 Terraform Modules
terragrunt run --all init

# 使用 Terragrunt 執行全部 Terraform Plan
terragrunt run --all plan

# 使用 Terragrunt 執行全部 Terraform Apply
# terragrunt run --all apply
