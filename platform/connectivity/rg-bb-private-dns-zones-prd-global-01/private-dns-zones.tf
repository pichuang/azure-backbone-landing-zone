locals {
  private_dns_zones = {
    name                = "private-dns-zones"
    resource_group_name = "rg-bb-private-dns-zones-prd-global-01"
    location            = "japanwest"
  }
}

resource "azurerm_resource_group" "rg_private_dns_zones" {
  name     = local.private_dns_zones.resource_group_name
  location = local.private_dns_zones.location
}

# https://learn.microsoft.com/zh-tw/azure/private-link/private-endpoint-dns#virtual-network-and-on-premises-workloads-using-a-dns-forwarder
# AI + Machine Learning
resource "azurerm_private_dns_zone" "privatelink_api_azureml_ms" {
  name                = "privatelink.api.azureml.ms"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_notebooks_azure_net" {
  name                = "privatelink.notebooks.azure.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_cognitiveservices_azure_com" {
  name                = "privatelink.cognitiveservices.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_openai_azure_com" {
  name                = "privatelink.openai.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_services_ai_azure_com" {
  name                = "privatelink.services.ai.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_directline_botframework_com" {
  name                = "privatelink.directline.botframework.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_token_botframework_com" {
  name                = "privatelink.token.botframework.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

# Analytics
resource "azurerm_private_dns_zone" "privatelink_sql_azuresynapse_net" {
  name                = "privatelink.sql.azuresynapse.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_dev_azuresynapse_net" {
  name                = "privatelink.dev.azuresynapse.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_azuresynapse_net" {
  name                = "privatelink.azuresynapse.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_servicebus_windows_net" {
  name                = "privatelink.servicebus.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_datafactory_azure_net" {
  name                = "privatelink.datafactory.azure.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_adf_azure_com" {
  name                = "privatelink.adf.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_azurehdinsight_net" {
  name                = "privatelink.azurehdinsight.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

# 特殊 Azure Data Explorer (Microsoft.Kusto/Clusters)
resource "azurerm_private_dns_zone" "privatelink_japanwest_kusto_windows_net" {
  name                = "privatelink.japanwest.kusto.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_japaneast_kusto_windows_net" {
  name                = "privatelink.japaneast.kusto.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_taiwannorth_kusto_windows_net" {
  name                = "privatelink.taiwannorth.kusto.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_westus3_kusto_windows_net" {
  name                = "privatelink.westus3.kusto.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_analysis_windows_net" {
  name                = "privatelink.analysis.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_pbidedicated_windows_net" {
  name                = "privatelink.pbidedicated.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_tip1_powerquery_microsoft_com" {
  name                = "privatelink.tip1.powerquery.microsoft.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_azuredatabricks_net" {
  name                = "privatelink.azuredatabricks.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_fabric_microsoft_com" {
  name                = "privatelink.fabric.microsoft.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

# Compute
resource "azurerm_private_dns_zone" "privatelink_batch_azure_com" {
  name                = "privatelink.batch.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_global_wvd_microsoft_com" {
  name                = "privatelink-global.wvd.microsoft.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_wvd_microsoft_com" {
  name                = "privatelink.wvd.microsoft.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

# Containers
# 特殊 Azure Kubernetes Service - Kubernetes API (Microsoft.ContainerService/managedClusters)
resource "azurerm_private_dns_zone" "privatelink_japaneast_azmk8s_io" {
  name                = "privatelink.japaneast.azmk8s.io"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_japanwest_azmk8s_io" {
  name                = "privatelink.japanwest.azmk8s.io"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_taiwannorth_azmk8s_io" {
  name                = "privatelink.taiwannorth.azmk8s.io"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_westus3_azmk8s_io" {
  name                = "privatelink.westus3.azmk8s.io"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

# Azure Container Apps (Microsoft.App/ManagedEnvironments)
resource "azurerm_private_dns_zone" "privatelink_japaneast_azurecontainerapps_io" {
  name                = "privatelink.japaneast.azurecontainerapps.io"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_japanwest_azurecontainerapps_io" {
  name                = "privatelink.japanwest.azurecontainerapps.io"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_taiwannorth_azurecontainerapps_io" {
  name                = "privatelink.taiwannorth.azurecontainerapps.io"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_westus3_azurecontainerapps_io" {
  name                = "privatelink.westus3.azurecontainerapps.io"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}



resource "azurerm_private_dns_zone" "privatelink_azurecr_io" {
  name                = "privatelink.azurecr.io"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "japaneast_privatelink_azurecr_io" {
  name                = "japaneast.data.privatelink.azurecr.io"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "japanwest_privatelink_azurecr_io" {
  name                = "japanwest.data.privatelink.azurecr.io"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "taiwannorth_privatelink_azurecr_io" {
  name                = "taiwannorth.data.privatelink.azurecr.io"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "westus3_privatelink_azurecr_io" {
  name                = "westus3.data.privatelink.azurecr.io"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

# Databases
resource "azurerm_private_dns_zone" "privatelink_database_windows_net" {
  name                = "privatelink.database.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_documents_azure_com" {
  name                = "privatelink.documents.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_mongo_cosmos_azure_com" {
  name                = "privatelink.mongo.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_cassandra_cosmos_azure_com" {
  name                = "privatelink.cassandra.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_gremlin_cosmos_azure_com" {
  name                = "privatelink.gremlin.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_table_cosmos_azure_com" {
  name                = "privatelink.table.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_analytics_cosmos_azure_com" {
  name                = "privatelink.analytics.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_postgres_cosmos_azure_com" {
  name                = "privatelink.postgres.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_postgres_database_azure_com" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_mysql_database_azure_com" {
  name                = "privatelink.mysql.database.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_mariadb_database_azure_com" {
  name                = "privatelink.mariadb.database.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_redis_cache_windows_net" {
  name                = "privatelink.redis.cache.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_redis_enterprise_cache_windows_net" {
  name                = "privatelink.redis.enterprise.cache.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

# Storage
resource "azurerm_private_dns_zone" "privatelink_blob_core_windows_net" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_table_core_windows_net" {
  name                = "privatelink.table.core.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_queue_core_windows_net" {
  name                = "privatelink.queue.core.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_file_core_windows_net" {
  name                = "privatelink.file.core.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_web_core_windows_net" {
  name                = "privatelink.web.core.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_dfs_core_windows_net" {
  name                = "privatelink.dfs.core.windows.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_afs_azure_net" {
  name                = "privatelink.afs.azure.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

# Integration
resource "azurerm_private_dns_zone" "privatelink_eventgrid_azure_net" {
  name                = "privatelink.eventgrid.azure.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_ts_eventgrid_azure_net" {
  name                = "privatelink.ts.eventgrid.azure.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_azure_api_net" {
  name                = "privatelink.azure-api.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_azurehealthcareapis_com" {
  name                = "privatelink.azurehealthcareapis.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_dicom_azurehealthcareapis_com" {
  name                = "privatelink.dicom.azurehealthcareapis.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

# IoT
resource "azurerm_private_dns_zone" "privatelink_azure_devices_net" {
  name                = "privatelink.azure-devices.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_azure_devices_provisioning_net" {
  name                = "privatelink.azure-devices-provisioning.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_api_adu_microsoft_com" {
  name                = "privatelink.api.adu.microsoft.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_azureiotcentral_com" {
  name                = "privatelink.azureiotcentral.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_digitaltwins_azure_net" {
  name                = "privatelink.digitaltwins.azure.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

# Media
resource "azurerm_private_dns_zone" "privatelink_media_azure_net" {
  name                = "privatelink.media.azure.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

# Management and Governance
resource "azurerm_private_dns_zone" "privatelink_azure_automation_net" {
  name                = "privatelink.azure-automation.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_jpe_backup_windowsazure_com" {
  name                = "privatelink.jpe.backup.windowsazure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_jpw_backup_windowsazure_com" {
  name                = "privatelink.jpw.backup.windowsazure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_twn_backup_windowsazure_com" {
  name                = "privatelink.twn.backup.windowsazure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_wus3_backup_windowsazure_com" {
  name                = "privatelink.wus3.backup.windowsazure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_siterecovery_windowsazure_com" {
  name                = "privatelink.siterecovery.windowsazure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_monitor_azure_com" {
  name                = "privatelink.monitor.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_oms_opinsights_azure_com" {
  name                = "privatelink.oms.opinsights.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_ods_opinsights_azure_com" {
  name                = "privatelink.ods.opinsights.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_agentsvc_azure_automation_net" {
  name                = "privatelink.agentsvc.azure-automation.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_purview_azure_com" {
  name                = "privatelink.purview.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_purviewstudio_azure_com" {
  name                = "privatelink.purviewstudio.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_purview_service_microsoft_com" {
  name                = "privatelink.purview-service.microsoft.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_prod_migration_windowsazure_com" {
  name                = "privatelink.prod.migration.windowsazure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_azure_com" {
  name                = "privatelink.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_grafana_azure_com" {
  name                = "privatelink.grafana.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

# Security
resource "azurerm_private_dns_zone" "privatelink_vaultcore_azure_net" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_managedhsm_azure_net" {
  name                = "privatelink.managedhsm.azure.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_azconfig_io" {
  name                = "privatelink.azconfig.io"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

# Hybrid / Arc
resource "azurerm_private_dns_zone" "privatelink_his_arc_azure_com" {
  name                = "privatelink.his.arc.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_guestconfiguration_azure_com" {
  name                = "privatelink.guestconfiguration.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_dp_kubernetesconfiguration_azure_com" {
  name                = "privatelink.dp.kubernetesconfiguration.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

# Web / SignalR
resource "azurerm_private_dns_zone" "privatelink_signalr_net" {
  name                = "privatelink.signalr.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "privatelink_service_signalr_net" {
  name                = "privatelink.service.signalr.net"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}

resource "azurerm_private_dns_zone" "bastion_azure_com" {
  name                = "bastion.azure.com"
  resource_group_name = azurerm_resource_group.rg_private_dns_zones.name
}