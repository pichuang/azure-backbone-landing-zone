output "dns_name" {
  description = "The DNS name of the Azure Bastion Host in Japan West."
  value       = module.bastionhost_prd_jpw_01.dns_name
}