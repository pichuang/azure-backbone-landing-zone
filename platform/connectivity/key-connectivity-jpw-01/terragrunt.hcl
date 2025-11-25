include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "."
}

dependency "vnet_connectivity" {
  config_path = "../vnet-connectivity-jpw-01"
  mock_outputs = {
    subnet_id = "/subscriptions/000/resourceGroups/mock/providers/Microsoft.Network/virtualNetworks/mock-vnet/subnets/mock-subnet"
  }
}

inputs = {
  subscription_id  = include.root.locals.merged_global_vars.subscription_connectivity_id
  tenant_id        = include.root.locals.merged_global_vars.tenant_id
  subnet_id        = dependency.vnet_connectivity.outputs.subnet_id
}
