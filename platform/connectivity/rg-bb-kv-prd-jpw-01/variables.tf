variable "primary_location" {
  description = "請填寫主要部署區域，例如：japanwest"
  type        = string
}

variable "subscription_id" {
  description = "請填寫 Azure 訂閱 ID"
  type        = string
}

variable "tenant_id" {
  description = "請填寫 Azure 租戶 ID"
  type        = string
}

variable "privatelink_vaultcore_azure_net_id" {
  description = "Resource ID for privatelink.vaultcore.azure.net private DNS zone"
  type        = string
}

variable "private_endpoint_subnet_id" {
  description = "Resource ID for the snet-kv subnet used by private endpoints"
  type        = string
}
