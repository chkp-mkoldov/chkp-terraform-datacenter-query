variable "az-appid" {
  description = "Azure Application ID"
}
variable "az-secret" {
  description = "Azure Application ID Secret"
}
variable "az-tenantid" {
  description = "Azure Tenant ID"
}


resource "checkpoint_management_azure_data_center_server" "testAzure" {
  name                  = "myAzure"
  authentication_method = "service-principal-authentication"
  directory_id          = var.az-tenantid
  application_id        = var.az-appid
  application_key       = var.az-secret
}

resource "checkpoint_management_data_center_query" "uprod" {
  name         = "Ubuntu in prod on myAzure"
  data_centers = [checkpoint_management_azure_data_center_server.testAzure.name]
  #   query_rules {
  #   key_type = "predefined"
  #   key      = "type-in-data-center"
  #   values   = ["Virtual Machine"]
  # }
  query_rules {
    key_type = "tag"
    key      = "env"
    values   = ["prod"]
  }
  query_rules {
    key_type = "tag"
    key      = "app"
    values   = ["ubuntu"]
  }
  lifecycle {
    ignore_changes = [

      query_rules,
    ]
  }
}

resource "checkpoint_management_data_center_query" "utest" {
  name         = "Ubuntu in test on myAzure"
  data_centers = [checkpoint_management_azure_data_center_server.testAzure.name]
  #   query_rules {
  #   key_type = "predefined"
  #   key      = "type-in-data-center"
  #   values   = ["Virtual Machine"]
  # }
  query_rules {
    key_type = "tag"
    key      = "env"
    values   = ["test"]
  }
  query_rules {
    key_type = "tag"
    key      = "app"
    values   = ["ubuntu"]
  }
  lifecycle {
    ignore_changes = [

      query_rules,
    ]
  }
}