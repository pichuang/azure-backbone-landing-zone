
# 從 vhub-azure-jpw-prd <- peering sidecar-prd-jpw-01
resource "azurerm_virtual_hub_connection" "peering_sidecar_prd_jpw_01" {
  name                      = "peer-to-vnet-sidecar-prd-jpw-01"
  virtual_hub_id            = azurerm_virtual_hub.vhub_azure_jpw_prd_01.id
  remote_virtual_network_id = var.vnet_sidecar_jpw_01_id
  internet_security_enabled = true
}
