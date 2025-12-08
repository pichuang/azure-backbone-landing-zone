module "network_manager" {
  source           = "Azure/avm-res-network-networkmanager/azurerm"
  version          = "0.2.1"
  enable_telemetry = "false"

  name                = local.avnm_prd_jpw_01.name
  resource_group_name = local.avnm_prd_jpw_01.resource_group_name
  location            = local.avnm_prd_jpw_01.location

  network_manager_description    = "自動化管理 Spoke 網路連線資源的 Azure Virtual Network Manager"
  network_manager_scope_accesses = ["Connectivity", "SecurityAdmin"]
  network_manager_scope = {
    subscription_ids = [
      "${var.subscription_id}"
    ]
  }
  #   network_manager_network_groups = {
  #     "network-group-1" = {
  #       name = "network-group-1"
  #       static_members = [
  #         {
  #           name                      = "static-member-1"
  #           target_virtual_network_id = azurerm_virtual_network.this.id
  #         }
  #       ]
  #     }
  #   }
}