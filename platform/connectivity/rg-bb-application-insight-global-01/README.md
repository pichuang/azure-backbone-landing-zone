# 私有網路內網站可用性測試

Application Insights 的內建可用性測試（Availability Tests，包含 URL Ping 或標準測試）不支援直接測試位於私有網路（Private Network / Intranet）內的端點。但可以透過建立 azure service + 自訂可用性測試來達到一樣的需求

## 環境

- App Service Dedicated Plan
  - 需 vnet integration
  - Always On
- ApplicationInsights + Python3
