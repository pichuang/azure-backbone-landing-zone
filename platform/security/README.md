# Security Subscirption

這個訂用帳戶主要由資安維運中心 (SOC / SecOps) 團隊管理

## 核心服務清單

- Azure Log Analystics Workspace (中央日誌工作區)
  - 所有 Application Landing Zone 的應用程式、身份驗證、連線等 Log 和 Metrics 都應透過 Diagnostics Setting 彙整到這邊
- Microsoft Sentinel (雲端原生 SIEM)
- Microsoft Defender for Cloud
  - 安全聯絡人 (Security Contacts)
  - 自動佈建 (Auto Provisioning)
  - 持續導出 (Continuse Export)
- Azure Key Vault (中央金鑰保存庫)
  - 集中式磁碟加密金鑰 (Disk Encryption Sets)
  - SOC 自動化工具所需的 Service Principal 憑證
- Azure Managed HSM
  - 憑證授權中心的根憑證 (Root CA Private Key)
- Azure Logic Apps (Playbooks)
  - SOAR 資安自動化回應

## 資源群組

- rg-sec-sentinel-01
  - Microsoft sentinel
  - Logic Apps

- rg-sec-core-01
  - Key Vault Central
  - Defender for Cloud configs
