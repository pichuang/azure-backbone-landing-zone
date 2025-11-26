variable "primary_location" {
  description = "請填寫主要部署區域，例如：japanwest"
  type        = string
}

variable "subscription_id" {
  description = "請填寫 Azure 訂閱 ID"
  type        = string
}

variable "log_soc_prd_jpw_01_workspace_id" {
  description = "log-soc-prd-jpw-01 Log Analytics Workspace Resource ID"
  type        = string
}
