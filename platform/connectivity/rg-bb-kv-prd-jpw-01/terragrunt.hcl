include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "."
}

# 定義依賴關係
dependency "private_dns_zones_prd_global_01" {
  config_path = "../rg-bb-private-dns-zones-prd-global-01"

  # (選用) 設定 mock_outputs，這在尚未部署 private_dns_zones_prd_global_01 就要跑 plan 時很重要
  mock_outputs = {
    private_dns_zone_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.Network/privateDnsZones/mock-privatelink-zone"
  }
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
}

dependency "sidecar_prd_jpw_01" {
  config_path = "../rg-bb-sidecar-prd-jpw-01"

  mock_outputs = {
    snet_kv_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworks/mock-vnet/subnets/mock-snet"
  }
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
}

inputs = {
  subscription_id           = include.root.locals.merged_global_vars.subscription_connectivity_id
  tenant_id                 = include.root.locals.merged_global_vars.tenant_id
  private_dns_zone_id       = dependency.private_dns_zones_prd_global_01.outputs.private_dns_zone_id
  private_endpoint_subnet_id = dependency.sidecar_prd_jpw_01.outputs.snet_kv_id
}
