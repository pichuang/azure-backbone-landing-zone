# Azure Core Landing Zone

## 目的

1. 降低「爆炸半徑（Blast Radius）」
2. 提升並行開發效率
3. 滿足權限隔離

## 如何使用

1. 複製環境變數

    ```bash
    cp global.local-dev.hcl.example global.local-dev.hcl
    ```

2. 將訂閱 ID 填寫進去

3. 執行 Terragrunt Plan 確認狀態

    ```bash
    sh ./0-terragrunt-local-dev-plan.sh
    ```

確認沒問題才執行

4. 執行 Terragrunt Apply 進行部署驗證

    ```bash
    sh ./1-terragrunt-local-dev-deploy.sh
    ```

5. 如果測試完, 要進行清理的話, 請下這個指令, 他會把 `全部` 資源移除

    ```bash
    sh ./2-terragrunt-local-dev-destroy.sh
    ```

## 使用 User Assign Identity
1. 調整 0-terragrunt-local-dev-plan.sh 參數
    ```bash
    export TF_VAR_use_msi=true
    export TF_VAR_use_cli=false
    ```
2. 設定 User Assigned Identity ID
    ```bash
    export ARM_CLIENT_ID=<your_User_Assigned_Identity_Client_ID>
    ```
3. 執行 Terragrunt Plan 確認狀態

    ```bash
    sh ./0-terragrunt-local-dev-plan.sh
    ```