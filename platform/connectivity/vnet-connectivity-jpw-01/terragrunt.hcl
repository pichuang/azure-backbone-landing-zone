include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "."
}

inputs = {
  subscription_id  = include.root.locals.merged_global_vars.subscription_connectivity_id
}
