# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_log_analytics_workspace_onboarding
resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinel_soc_prd_jpw_01" {
  workspace_id                 = azurerm_log_analytics_workspace.log_soc_prd_jpw_01.id
  customer_managed_key_enabled = true
}