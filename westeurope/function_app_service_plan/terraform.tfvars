terragrunt = {
  dependencies {
    paths = [
      "../storage_account_appdata",
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/io-infrastructure-modules.git//azurerm_app_service_plan"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# App service plan module related variables
azurerm_app_service_plan_sku_tier = "Isolated"

azurerm_app_service_plan_sku_size = "I1"

#azurerm_app_service_plan_sku_capacity = "2"

azurerm_app_service_plan_suffix = "function-app"
