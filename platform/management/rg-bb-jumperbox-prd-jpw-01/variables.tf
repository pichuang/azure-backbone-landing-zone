variable "primary_location" {
  description = "請填寫主要部署區域，例如：japanwest"
  type        = string
  default     = "japanwest"
}

variable "subscription_id" {
  description = "請填寫 Azure 訂閱 ID"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "請填寫 Log Analytics Workspace 的 Resource ID"
  type        = string
}

variable "snet_jumperbox_id" {
  description = "請填寫 Azure Jumperbox Subnet 子網段的 Resource ID"
  type        = string
}