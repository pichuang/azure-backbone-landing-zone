locals {
  pdns_vnet_sidecar_jpw_01_vlink = {
    resolution_policy = "Default" # NxDomainRedirect = Fallback to Internet
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_api_azureml_ms" {
  name                  = "vlink-privatelink-api-azureml-ms"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_api_azureml_ms.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_notebooks_azure_net" {
  name                  = "vlink-privatelink-notebooks-azure-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_notebooks_azure_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_cognitiveservices_azure_com" {
  name                  = "vlink-privatelink-cognitiveservices-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_cognitiveservices_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_openai_azure_com" {
  name                  = "vlink-privatelink-openai-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_openai_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_services_ai_azure_com" {
  name                  = "vlink-privatelink-services-ai-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_services_ai_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_directline_botframework_com" {
  name                  = "vlink-privatelink-directline-botframework-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_directline_botframework_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_token_botframework_com" {
  name                  = "vlink-privatelink-token-botframework-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_token_botframework_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

# Analytics
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_sql_azuresynapse_net" {
  name                  = "vlink-privatelink-sql-azuresynapse-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_sql_azuresynapse_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_dev_azuresynapse_net" {
  name                  = "vlink-privatelink-dev-azuresynapse-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_dev_azuresynapse_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azuresynapse_net" {
  name                  = "vlink-privatelink-azuresynapse-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azuresynapse_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_servicebus_windows_net" {
  name                  = "vlink-privatelink-servicebus-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_servicebus_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_datafactory_azure_net" {
  name                  = "vlink-privatelink-datafactory-azure-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_datafactory_azure_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_adf_azure_com" {
  name                  = "vlink-privatelink-adf-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_adf_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azurehdinsight_net" {
  name                  = "vlink-privatelink-azurehdinsight-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azurehdinsight_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

# 特殊 Azure Data Explorer (Microsoft.Kusto/Clusters)
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_japanwest_kusto_windows_net" {
  name                  = "vlink-privatelink-japanwest-kusto-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_japanwest_kusto_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_japaneast_kusto_windows_net" {
  name                  = "vlink-privatelink-japaneast-kusto-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_japaneast_kusto_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_taiwannorth_kusto_windows_net" {
  name                  = "vlink-privatelink-taiwannorth-kusto-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_taiwannorth_kusto_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_westus3_kusto_windows_net" {
  name                  = "vlink-privatelink-westus3-kusto-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_westus3_kusto_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_analysis_windows_net" {
  name                  = "vlink-privatelink-analysis-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_analysis_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_pbidedicated_windows_net" {
  name                  = "vlink-privatelink-pbidedicated-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_pbidedicated_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_tip1_powerquery_microsoft_com" {
  name                  = "vlink-privatelink-tip1-powerquery-microsoft-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_tip1_powerquery_microsoft_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azuredatabricks_net" {
  name                  = "vlink-privatelink-azuredatabricks-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azuredatabricks_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_fabric_microsoft_com" {
  name                  = "vlink-privatelink-fabric-microsoft-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_fabric_microsoft_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

# Compute
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_batch_azure_com" {
  name                  = "vlink-privatelink-batch-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_batch_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_global_wvd_microsoft_com" {
  name                  = "vlink-privatelink-global-wvd-microsoft-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_global_wvd_microsoft_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_wvd_microsoft_com" {
  name                  = "vlink-privatelink-wvd-microsoft-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_wvd_microsoft_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

# Containers
# 特殊 Azure Kubernetes Service - Kubernetes API (Microsoft.ContainerService/managedClusters)
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_japaneast_azmk8s_io" {
  name                  = "vlink-privatelink-japaneast-azmk8s-io"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_japaneast_azmk8s_io.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_japanwest_azmk8s_io" {
  name                  = "vlink-privatelink-japanwest-azmk8s-io"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_japanwest_azmk8s_io.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_taiwannorth_azmk8s_io" {
  name                  = "vlink-privatelink-taiwannorth-azmk8s-io"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_taiwannorth_azmk8s_io.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_westus3_azmk8s_io" {
  name                  = "vlink-privatelink-westus3-azmk8s-io"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_westus3_azmk8s_io.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

# Azure Container Apps (Microsoft.App/ManagedEnvironments)
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_japaneast_azurecontainerapps_io" {
  name                  = "vlink-privatelink-japaneast-azurecontainerapps-io"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_japaneast_azurecontainerapps_io.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_japanwest_azurecontainerapps_io" {
  name                  = "vlink-privatelink-japanwest-azurecontainerapps-io"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_japanwest_azurecontainerapps_io.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_taiwannorth_azurecontainerapps_io" {
  name                  = "vlink-privatelink-taiwannorth-azurecontainerapps-io"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_taiwannorth_azurecontainerapps_io.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_westus3_azurecontainerapps_io" {
  name                  = "vlink-privatelink-westus3-azurecontainerapps-io"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_westus3_azurecontainerapps_io.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azurecr_io" {
  name                  = "vlink-privatelink-azurecr-io"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azurecr_io.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "japaneast_privatelink_azurecr_io" {
  name                  = "vlink-japaneast-privatelink-azurecr-io"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.japaneast_privatelink_azurecr_io.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "japanwest_privatelink_azurecr_io" {
  name                  = "vlink-japanwest-privatelink-azurecr-io"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.japanwest_privatelink_azurecr_io.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "taiwannorth_privatelink_azurecr_io" {
  name                  = "vlink-taiwannorth-privatelink-azurecr-io"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.taiwannorth_privatelink_azurecr_io.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "westus3_privatelink_azurecr_io" {
  name                  = "vlink-westus3-privatelink-azurecr-io"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.westus3_privatelink_azurecr_io.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

# Databases
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_database_windows_net" {
  name                  = "vlink-privatelink-database-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_database_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_documents_azure_com" {
  name                  = "vlink-privatelink-documents-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_documents_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_mongo_cosmos_azure_com" {
  name                  = "vlink-privatelink-mongo-cosmos-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_mongo_cosmos_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_cassandra_cosmos_azure_com" {
  name                  = "vlink-privatelink-cassandra-cosmos-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_cassandra_cosmos_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_gremlin_cosmos_azure_com" {
  name                  = "vlink-privatelink-gremlin-cosmos-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_gremlin_cosmos_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_table_cosmos_azure_com" {
  name                  = "vlink-privatelink-table-cosmos-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_table_cosmos_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_analytics_cosmos_azure_com" {
  name                  = "vlink-privatelink-analytics-cosmos-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_analytics_cosmos_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_postgres_cosmos_azure_com" {
  name                  = "vlink-privatelink-postgres-cosmos-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_postgres_cosmos_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_postgres_database_azure_com" {
  name                  = "vlink-privatelink-postgres-database-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_postgres_database_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_mysql_database_azure_com" {
  name                  = "vlink-privatelink-mysql-database-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_mysql_database_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_mariadb_database_azure_com" {
  name                  = "vlink-privatelink-mariadb-database-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_mariadb_database_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_redis_cache_windows_net" {
  name                  = "vlink-privatelink-redis-cache-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_redis_cache_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_redis_enterprise_cache_windows_net" {
  name                  = "vlink-privatelink-redis-enterprise-cache-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_redis_enterprise_cache_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

# Storage
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_blob_core_windows_net" {
  name                  = "vlink-privatelink-blob-core-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_blob_core_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_table_core_windows_net" {
  name                  = "vlink-privatelink-table-core-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_table_core_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_queue_core_windows_net" {
  name                  = "vlink-privatelink-queue-core-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_queue_core_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_file_core_windows_net" {
  name                  = "vlink-privatelink-file-core-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_file_core_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_web_core_windows_net" {
  name                  = "vlink-privatelink-web-core-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_web_core_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_dfs_core_windows_net" {
  name                  = "vlink-privatelink-dfs-core-windows-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_dfs_core_windows_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_afs_azure_net" {
  name                  = "vlink-privatelink-afs-azure-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_afs_azure_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

# Integration
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_eventgrid_azure_net" {
  name                  = "vlink-privatelink-eventgrid-azure-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_eventgrid_azure_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_ts_eventgrid_azure_net" {
  name                  = "vlink-privatelink-ts-eventgrid-azure-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_ts_eventgrid_azure_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azure_api_net" {
  name                  = "vlink-privatelink-azure-api-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azure_api_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azurehealthcareapis_com" {
  name                  = "vlink-privatelink-azurehealthcareapis-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azurehealthcareapis_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_dicom_azurehealthcareapis_com" {
  name                  = "vlink-privatelink-dicom-azurehealthcareapis-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_dicom_azurehealthcareapis_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

# IoT
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azure_devices_net" {
  name                  = "vlink-privatelink-azure-devices-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azure_devices_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azure_devices_provisioning_net" {
  name                  = "vlink-privatelink-azure-devices-provisioning-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azure_devices_provisioning_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_api_adu_microsoft_com" {
  name                  = "vlink-privatelink-api-adu-microsoft-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_api_adu_microsoft_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azureiotcentral_com" {
  name                  = "vlink-privatelink-azureiotcentral-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azureiotcentral_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_digitaltwins_azure_net" {
  name                  = "vlink-privatelink-digitaltwins-azure-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_digitaltwins_azure_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

# Media
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_media_azure_net" {
  name                  = "vlink-privatelink-media-azure-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_media_azure_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

# Management and Governance
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azure_automation_net" {
  name                  = "vlink-privatelink-azure-automation-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azure_automation_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_jpe_backup_windowsazure_com" {
  name                  = "vlink-privatelink-jpe-backup-windowsazure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_jpe_backup_windowsazure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_jpw_backup_windowsazure_com" {
  name                  = "vlink-privatelink-jpw-backup-windowsazure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_jpw_backup_windowsazure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_twn_backup_windowsazure_com" {
  name                  = "vlink-privatelink-twn-backup-windowsazure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_twn_backup_windowsazure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_wus3_backup_windowsazure_com" {
  name                  = "vlink-privatelink-wus3-backup-windowsazure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_wus3_backup_windowsazure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_siterecovery_windowsazure_com" {
  name                  = "vlink-privatelink-siterecovery-windowsazure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_siterecovery_windowsazure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_monitor_azure_com" {
  name                  = "vlink-privatelink-monitor-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_monitor_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_oms_opinsights_azure_com" {
  name                  = "vlink-privatelink-oms-opinsights-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_oms_opinsights_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_ods_opinsights_azure_com" {
  name                  = "vlink-privatelink-ods-opinsights-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_ods_opinsights_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_agentsvc_azure_automation_net" {
  name                  = "vlink-privatelink-agentsvc-azure-automation-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_agentsvc_azure_automation_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_purview_azure_com" {
  name                  = "vlink-privatelink-purview-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_purview_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_purviewstudio_azure_com" {
  name                  = "vlink-privatelink-purviewstudio-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_purviewstudio_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_purview_service_microsoft_com" {
  name                  = "vlink-privatelink-purview-service-microsoft-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_purview_service_microsoft_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_prod_migration_windowsazure_com" {
  name                  = "vlink-privatelink-prod-migration-windowsazure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_prod_migration_windowsazure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azure_com" {
  name                  = "vlink-privatelink-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_grafana_azure_com" {
  name                  = "vlink-privatelink-grafana-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_grafana_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

# Security
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_vaultcore_azure_net" {
  name                  = "vlink-privatelink-vaultcore-azure-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_vaultcore_azure_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_managedhsm_azure_net" {
  name                  = "vlink-privatelink-managedhsm-azure-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_managedhsm_azure_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azconfig_io" {
  name                  = "vlink-privatelink-azconfig-io"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azconfig_io.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

# Hybrid / Arc
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_his_arc_azure_com" {
  name                  = "vlink-privatelink-his-arc-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_his_arc_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_guestconfiguration_azure_com" {
  name                  = "vlink-privatelink-guestconfiguration-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_guestconfiguration_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_dp_kubernetesconfiguration_azure_com" {
  name                  = "vlink-privatelink-dp-kubernetesconfiguration-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_dp_kubernetesconfiguration_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

# Web / SignalR
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_signalr_net" {
  name                  = "vlink-privatelink-signalr-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_signalr_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_service_signalr_net" {
  name                  = "vlink-privatelink-service-signalr-net"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_service_signalr_net.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}

resource "azurerm_private_dns_zone_virtual_network_link" "bastion_azure_com" {
  name                  = "vlink-bastion-azure-com"
  resource_group_name   = azurerm_resource_group.rg_private_dns_zones.name
  private_dns_zone_name = azurerm_private_dns_zone.bastion_azure_com.name
  virtual_network_id    = var.vnet_sidecar_jpw_01_id
  registration_enabled  = false
  resolution_policy     = local.pdns_vnet_sidecar_jpw_01_vlink.resolution_policy
}