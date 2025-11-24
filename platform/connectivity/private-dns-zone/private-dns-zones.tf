locals {
  private_dns_zones = {
    name     = "private-dns-zones"
    location = "japanwest"
  }
}

resource "azurerm_resource_group" "rg_private_dns_zones" {
  name     = "rg-${local.private_dns_zones.name}"
  location = local.private_dns_zones.location
}

# https://learn.microsoft.com/zh-tw/azure/private-link/private-endpoint-dns#virtual-network-and-on-premises-workloads-using-a-dns-forwarder
resource "azurerm_private_dns_zone" "private_dns_zone_blob" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.example.name
}