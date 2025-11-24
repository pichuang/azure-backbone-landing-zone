# Q&A

## Q1: 為何不使用已經打包好的 Azure Landing Zone Accelerator

A1:

試圖用單一個 Terraform 根模組來管理如此龐大的環境，將面臨嚴重的效能與風險問題：

- 爆炸半徑（Blast Radius）過大：修改一個虛擬網路（VNet）的配置，可能需要重新整理（Refresh）包含數千個資源的狀態檔，任何錯誤操作都可能導致整個生產環境的癱瘓
- 執行效率低落：Terraform plan 與 apply 的時間會隨著資源數量線性增加，影響開發團隊的迭代速度
- 權限管理困難：難以實現精細的權限控制（Least Privilege），例如僅允許網路團隊修改防火牆規則，而不允許其觸碰身分識別資源

## Q2: VNet Peering 是否要獨立一個 tf 出來撰寫?

Q2:

Yes. 避免循環依賴 (Circular Dependencies). 在 Azure 網路設計中，VNet Peering 是一個經典的循環依賴場景（VNet A 需要 peering 到 VNet B，VNet B 也需要 peering 到 VNet A）

建議將 Peering 動作從 vnet 資源抽離出來, 作為獨立模組使用

```dotnetcli
platform/connectivity/
├── vwan-global-01/
├── peering-devsecops/ # 獨立模組
```
