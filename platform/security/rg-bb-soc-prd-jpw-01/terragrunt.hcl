include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "."
}

# 這邊要改成要使用的 Subscription ID
inputs = {
  subscription_id  = include.root.locals.merged_global_vars.subscription_security_id
}
