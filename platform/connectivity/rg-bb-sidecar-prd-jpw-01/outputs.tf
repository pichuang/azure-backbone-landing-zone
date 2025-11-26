output "snet_dnspr_in" {
  description = "Resource ID for snet-dnspr-in subnet within vnet-sidecar-jpw-01"
  value       = module.vnet_sidecar_jpw_01.subnets["snet_dnspr_in"].resource_id
}

output "snet_dnspr_out" {
  description = "Resource ID for snet-dnspr-out subnet within vnet-sidecar-jpw-01"
  value       = module.vnet_sidecar_jpw_01.subnets["snet_dnspr_out"].resource_id
}

output "snet_ampls_id" {
  description = "Resource ID for snet-ampls subnet within vnet-sidecar-jpw-01"
  value       = module.vnet_sidecar_jpw_01.subnets["snet_ampls"].resource_id
}

output "snet_kvhsm_id" {
  description = "Resource ID for snet-kvhsm subnet within vnet-sidecar-jpw-01"
  value       = module.vnet_sidecar_jpw_01.subnets["snet_kvhsm"].resource_id
}

output "snet_kv_id" {
  description = "Resource ID for snet-kv subnet within vnet-sidecar-jpw-01"
  value       = module.vnet_sidecar_jpw_01.subnets["snet_kv"].resource_id
}

output "snet_azurebastionsubnet_id" {
  description = "Resource ID for AzureBastionSubnet subnet within vnet-sidecar-jpw-01"
  value       = module.vnet_sidecar_jpw_01.subnets["snet_azurebastionsubnet"].resource_id
}

output "vnet_id" {
  description = "Resource ID for vnet-sidecar-jpw-01"
  value       = module.vnet_sidecar_jpw_01.resource_id
}
