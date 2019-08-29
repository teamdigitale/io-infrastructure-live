terragrunt = {
  dependencies {
    paths = [
      "../resource_group"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/io-infrastructure-modules.git//azurerm_storage_account"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Storage account module related variables
storage_account_name                                  = "appdata"
azurerm_storage_account_account_tier                  = "Standard"
azurerm_storage_account_account_replication_type      = "LRS"
azurerm_storage_account_network_rules_allowed_subnets = [
  {
    vnet   = "io-dev-vnet-common"
    subnet = "io-dev-subnet-functions"
  },
  {
    vnet   = "io-dev-vnet-common"
    subnet = "io-dev-subnet-function-app"
  },
  {
    vnet   = "io-dev-vnet-common"
    subnet = "io-dev-subnet-function-services"
  },
]
azurerm_storage_account_network_rules_allowed_ips     = ["5.97.129.253"]
