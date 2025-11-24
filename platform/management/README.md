# Management Subscirption

這個訂用帳戶主要由 IT 營運 (ITOps) 團隊管理，提供中央監控、備份與自動化管理

## 核心服務清單

- Azure Automation Account (自動化帳戶)
  - 用途： 用於存放 PowerShell/Python Runbooks，執行例行性維運任務
  - 關鍵功能：
    - Change Tracking & Inventory： 追蹤 VM 內的軟體變更
    - Update Management (或移轉至 Azure Update Manager)： 集中管理所有 VM 的修補程式 (Patching)
- Storage Account (儲存體帳戶)
  - 用途： 用於長期封存 (Archiving) 超過 Log Analytics 保留期限的日誌，或是存放 Boot Diagnostics 資料
  - 關鍵設定： 啟用 Immutable Storage (不可變更儲存) 以符合稽核需求。
- Azure Monitor Private Link Scope (AMPLS)
  - 用途： 針對嚴格的內網安全需求，AMPLS 確保監控流量 (Log 上傳) 透過 Azure Private Link 走私有網路，而不暴露在公網
- Recovery Services Vault (備份保存庫)
  - 用途： 雖然個別 Application Landing Zone 可能會有自己的備份，但會在此處保留一個中央 Vault 來存放關鍵的管理層級備份或設定 Backup Center 的中央政策

## 資源群組

- rg-mgmt-monitor-01
  - LAW
  - AMPLS
  - Storage Account (Archive)

- rg-mgmt-automation-01
  - Automation Account (Runbooks)
  - DSC Confiurations

- rg-mgmt-backup-01
  - Recovery Service Vault (Backup Center)
