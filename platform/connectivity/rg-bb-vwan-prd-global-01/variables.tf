variable "primary_location" {
  description = "請填寫主要部署區域，例如：japanwest"
  type        = string
}

variable "subscription_id" {
  description = "請填寫 Azure 訂閱 ID"
  type        = string
}

variable "afwp_azure_jpw_prd_01_id" {
  description = "來自 connectivity/rg-bb-afwp-prd-global-01 的 Firewall Policy Resource ID"
  type        = string
}

variable "log_soc_prd_jpw_01_workspace_id" {
  description = "來自 security/rg-bb-log-soc-prd-jpw-01 的 Log Analytics Workspace Resource ID"
  type        = string
}

variable "vnet_sidecar_jpw_01_id" {
  description = "來自 connectivity/rg-bb-sidecar-prd-jpw-01 的 VNet Resource ID"
  type        = string
}
