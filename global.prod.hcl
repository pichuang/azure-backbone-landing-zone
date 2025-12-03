# global.prod.hcl
# 為正式全域變數定義
# 如果你有變數需要讓所有的子模組都需要讀到的話, 需要在這邊定義變數和值

locals {

  # 決定 Azure 地理區域
  primary_location   = "japaneast"
  secondary_location = "japanwest"
  third_location     = "taiwanorth"
  dr_location        = "westus3"

  # 主要租戶 ID (Microsoft Entra ID)
  tenant_id = ""

  # 訂閱 ID 列表
  # 此為正式環境用的 Subscription ID 勿改
  subscription_connectivity_id = "#{connectivity_id}#"
  subscription_security_id     = "#{security_id}#"
  subscription_identity_id     = "#{identity_id}#"
  subscription_management_id   = "#{management_id}#"
  subscription_devsecops_id    = "#{devsecops_id}#"
}
