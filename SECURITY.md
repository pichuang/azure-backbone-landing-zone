---
post_title: Security Policy
author1: Core Landing Zone Team
post_slug: security-policy
microsoft_alias: pichuang
featured_image: https://learn.microsoft.com/azure/media/index/azure-security/azure-security.png
categories:
	- security
tags:
	- vulnerability-management
	- disclosure
	- support
ai_note: true
summary: 描述專案支援周期與安全性漏洞通報流程，以確保修補作業可預期。
post_date: 2025-11-25
---

<!-- markdownlint-disable-next-line MD041 -->
## Supported Versions

本專案依下表的生命週期策略提供安全性更新，僅維護仍在主動支援期間的版本分支。

| Version | Supported | 說明 |
| ------- | --------- | ---- |
| main   | :white_check_mark: | 最新版本，優先收到所有安全性修補與回溯套件 |
<!-- | 5.1.x   | :white_check_mark: | 最新穩定版本，優先收到所有安全性修補與回溯套件 |
| 5.0.x   | :x: | 僅在嚴重事故時提供手動建議，不再交付修補 |
| 4.0.x   | :white_check_mark: | 長期支援(LTS)分支，針對重大弱點提供必要修補 |
| < 4.0   | :x: | 已退役，請升級至受支援版本以獲得保護 | -->

## Reporting a Vulnerability

請依下列步驟通報疑似漏洞，以便我們快速評估與回應：

1. 透過 GitHub **Security Advisories** 私密通報或寄送電子郵件至 `phil.huang@microsoft.com`，並提供重現步驟、受影響模組與潛在衝擊。請勿建立公開 Issue，以避免在修補前洩漏細節。
2. 我們會在 3 個工作天內確認收到，並於 10 個工作天內提供初步處理狀態與下一步時程。若需要更多資訊，我們會請您補充必要證據或封包擷取結果。
3. 若漏洞確認成立，我們將指派修補負責人、排程修補版本，並在修補發布前與回報者協調揭露時程。依據嚴重度，我們可能釋出 hotfix、次要版本或建議升級到最新主版本。
4. 修補發布後，我們會更新本文件與發佈公告，同時致謝原回報者(若對方同意揭露)。若漏洞被判定為非議題，我們會提供理由與建議的風險緩解措施。

如需追蹤處理狀態，可使用上述安全性通道回覆原通報郵件，我們會在 5 個工作天內提供最新更新。若遇到高嚴重度議題(例如可遠端利用的權限升級)，請在主旨中標示 **[URGENT]** 以便我們即時升級優先順序。
