# https://registry.terraform.io/modules/Azure/avm-res-network-routetable/azurerm/latest

module "rt_snet_apim" {
  source           = "Azure/avm-res-network-routetable/azurerm"
  version          = "0.4.1"
  enable_telemetry = false

  name                = "rt-snet-apim"
  location            = azurerm_resource_group.rg_apim_standard_v2_jpw_dev.location
  resource_group_name = azurerm_resource_group.rg_apim_standard_v2_jpw_dev.name
  routes = {
    "route-to-internet" = {
      name           = "default-route"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "Internet"
    }
    "route-to-intranet" = {
      name                   = "route-to-intranet"
      address_prefix         = "10.0.0.0/8"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.227.0.132" # 大部分都是要設定 Firewall IP
    }
  }
}