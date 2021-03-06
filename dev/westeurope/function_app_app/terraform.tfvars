# Creates a Kubernetes Cluster through AKS using the Kubenet CNI.
# For more info look at the README.md file of the module.

terragrunt = {
  dependencies {
    paths = [
      "../function_app_service_plan_fn2app",
      "../cosmosdb_account_01",
      "../storage_account_appdata",
      "../storage_account_fn2app"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/io-infrastructure-modules.git//azurerm_function_app"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

plan_name            = "fn2app"
storage_account_name = "fn2app"
functionapp_name     = "2-app"

functionapp_settings = [
  {
    name  = "COSMOSDB_NAME"
    value = "io-dev-sqldb-db-01"
  },
  {
    name  = "FUNCTION_APP_EDIT_MODE"
    value = "readonly"
  },
  {
    name  = "WEBSITE_NODE_DEFAULT_VERSION"
    value = "10.14.1"
  },
  {
    name  = "WEBSITE_RUN_FROM_PACKAGE"
    value = "1" 
  },
  {
    name  = "MESSAGE_CONTAINER_NAME"
    value = "message-content"
  },
  {
    name  = "PUBLIC_API_URL"
    value = "https://api.dev.io.italia.it"
  },
  {
    name  = "WEBSITE_HTTPSCALEV2_ENABLED"
    value = "1"
  },
  {
    name  = "FUNCTIONS_EXTENSION_VERSION"
    value = "~2"
  },
  {
    name  = "SUBSCRIPTIONS_FEED_TABLE"
    value = "SubscriptionsFeedByDay"
  },
  {
    name  = "MAIL_FROM"
    value = "IO - l'app dei servizi pubblici <no-reply@io.italia.it>"
  },
  {
    name  = "MAIL_ORGANIZATION_FISCALCODE"
    value = "80188230587"
  },
  {
    name  = "MAIL_ORGANIZATION_NAME"
    value = "Presidenza del Consiglio dei Ministri"
  },
  {
    name  = "MAIL_SENDER_SERVICE"
    value = "Team per la Trasformazione Digitale<br />Progetto IO"
  },
  {
    name  = "FUNCTIONS_PUBLIC_URL"
    value = "https://api.dev.io.italia.it/public"
  },
  {
    name  = "NODE_ENV"
    value = "production"
  }
]

functionapp_settings_secrets = [
  {
    name        = "APPINSIGHTS_INSTRUMENTATIONKEY"
    vault_alias = "fn2-commons-app-insights-instrumentation-key"
  },
  {
    name        = "QueueStorageConnection"
    vault_alias = "fn2-commons-sa-appdata-primary-connection-string"
  },
  {
    name        = "PUBLIC_API_KEY"
    vault_alias = "fn2-app-public-api-key"
  },
  {
    name        = "MAILUP_USERNAME"
    vault_alias = "fn2-commons-mailup-username"
  },
  {
    name        = "MAILUP_SECRET"
    vault_alias = "fn2-commons-mailup-secret"
  },
]

functionapp_connection_strings = [
  {
    name        = "COSMOSDB_KEY"
    vault_alias = "fn2-commons-cosmosdb-key"
  },
  {
    name        = "COSMOSDB_URI"
    vault_alias = "fn2-commons-cosmosdb-uri"
  }
]
