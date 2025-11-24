locals {
  maintenance_config = {
    name     = "maintenance-config"
    location = "japanwest"
  }
}

resource "azurerm_resource_group" "rg_maintenance_config" {
  name     = "rg-${local.maintenance_config.name}"
  location = local.maintenance_config.location
}

module "mc_network_gateway" {
  source  = "Azure/avm-res-maintenance-maintenanceconfiguration/azurerm"
  version = "0.1.0"

  location            = local.maintenance_config.location
  name                = "mc-network-gateway"
  resource_group_name = azurerm_resource_group.rg_maintenance_config.name
  enable_telemetry    = false
  scope               = "Resource"
  extension_properties = {
    maintenanceSubScope = "NetworkGatewayMaintenance"
  }

  window = {
    time_zone = "Taipei Standard Time"
    # 如果有更新，允許在每天的幾點進行，這並不代表每天都會重啟，而是「每天晚上只有這段時間允許進行更新」
    recur_every     = "1Day"
    start_date_time = "2025-11-27 22:00"
    # expiration_date_time = "6666-10-01 00:00"
    duration = "05:00"
  }
}
# maintenanceSubScope= SQLDB,SQLManagedInstance,AKS,SFMC,NetworkGatewayMaintenance,APPSVC,NetworkSecurity
module "mc_network_firewall" {
  source  = "Azure/avm-res-maintenance-maintenanceconfiguration/azurerm"
  version = "0.1.0"

  location            = local.maintenance_config.location
  name                = "mc-network-firewall"
  resource_group_name = azurerm_resource_group.rg_maintenance_config.name
  enable_telemetry    = false
  scope               = "Resource"
  extension_properties = {
    maintenanceSubScope = "NetworkSecurity"
  }

  window = {
    time_zone = "Taipei Standard Time"
    # 如果有更新，允許在每天的幾點進行，這並不代表每天都會重啟，而是「每天晚上只有這段時間允許進行更新」
    recur_every     = "1Day"
    start_date_time = "2025-11-27 22:00"
    # expiration_date_time = "6666-10-01 00:00"
    duration = "05:00"
  }
}
