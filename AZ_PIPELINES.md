# Azure DevOps Pipeline 說明

## Pipeline 概述

此 Azure DevOps Pipeline 設計用於 Azure Backbone Landing Zone 專案的基礎設施部署Pipeline 使用 Terraform 和 Terragrunt 來管理 Azure 資源的生命週期

## 安全性考量
- 使用 Managed Identity 進行身份驗證 (目前 Managed DevOps Pool 僅支援使用 User Assign Identity)
- 透過 Azure DevOps 變數群組管理 Client ID 及 Subscription ID 等資訊
- 手動觸發確保部署控制

## 執行前置條件
- User Assigned Managed Identity 具備適當的 Azure 權限
- 部屬 Managed DevOps Pool 並確保 Azure DevOps 上之 Agent Pool 有正確設置
- 設定 Azure DevOps 上的變數群組 library 並包含必要的配置參數如下，以下參數會對應到 global.prod 中並於 pipeline 執行階段透過 replace 方式進行置換
  - connectivity_id
  - devsecops_id
  - identity_id
  - management_id
  - security_id
  - mi_client_id

## Pipeline 配置分析

### Trigger 設定
```yaml
trigger:
- none
```
**說明**：Pipeline 設定為手動觸發模式，不會自動執行這是安全的做法，特別適用於基礎設施部署，確保每次部署都經過人工審查和確認

### Agent Pool
```yaml
pool:
  name: pool-azdo-resource
  demands:
  - ImageOverride -equals ubuntu
```
**說明**：
- 使用自訂的 agent pool `pool-azdo-resource` (須調整為配合實際使用的 Agent Pool 名稱)
- 需指定使用 Ubuntu 作業系統映像

### 變數群組
```yaml
variables:
- group: global.prod
```
**說明**
- 引用 `global.prod` 變數群組，包含生產環境所需的配置參數和機密資訊
- 實際使用時請確保變數群組名稱與 Azure DevOps 中設定的名稱一致

## Pipeline 步驟詳解

### 1. Terraform 安裝
```yaml
- task: "TerraformInstaller@1"
  displayName: 'Install Terraform'
  inputs:
    terraformVersion: '1.13.5'
```
**目的**：安裝指定版本的 Terraform (v1.13.5)，確保版本一致性和相容性

### 2. Terraform 版本驗證
```yaml
- script: terraform -version
  displayName: 'Show terraform version'
```
**目的**：驗證並顯示安裝的 Terraform 版本，用於除錯和確認

### 3. Terragrunt 下載與安裝
```yaml
- script: wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.93.11/terragrunt_linux_amd64
  displayName: 'Download terragrunt binary'

- script: sudo install terragrunt_linux_amd64 /usr/local/bin/terragrunt && rm terragrunt_linux_amd64
  displayName: 'Install terragrunt'
```
**目的**：
- 下載 Terragrunt v0.93.11 二進制檔案
- 安裝到系統路徑並清理暫存檔案

### 4. Terragrunt 版本驗證
```yaml
- script: terragrunt -v
  displayName: 'Show terragrunt version'
```
**目的**：確認 Terragrunt 正確安裝並顯示版本資訊

### 5. Token 替換
```yaml
- task: replacetokens@6
  displayName: 'Replace tokens in global.prod.hcl'
  inputs:
    root: '$(System.DefaultWorkingDirectory)'
    sources: 'global.prod.hcl'
```
**目的**：
- 在 `global.prod.hcl` 檔案中替換 token 值
- 動態注入配置參數，支援多環境部署

### 6. 身份驗證設定
```yaml
- script: export ARM_CLIENT_ID=$(mi_client_id)
  displayName: 'Setup User Assigned Managed Identity Client ID'
```
**目的**：設定 Azure 身份驗證所需的 Managed Identity Client ID

### 7. Terragrunt 計畫執行
```yaml
- script: bash 0-terragrunt-local-dev-plan.sh
  displayName: 'Run terragrunt local dev plan'
```
**目的**：執行 Terragrunt plan 操作，預覽將要部署的基礎設施變更
