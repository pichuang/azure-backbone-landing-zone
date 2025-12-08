locals {
  ipgroup_global = {
    location            = var.primary_location
    resource_group_name = "rg-bb-ipgroup-global-01"
  }
}