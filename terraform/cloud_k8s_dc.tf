

variable "aks1_hostname" {
  description = "AKS hostname"
}
variable "aks1_token" {
  description = "AKS token"
}

resource "checkpoint_management_kubernetes_data_center_server" "aks1" {
  name               = "AKS1"
  hostname           = var.aks1_hostname
  token_file         = var.aks1_token
  unsafe_auto_accept = true
  ignore_warnings    = true

}

resource "checkpoint_management_data_center_query" "pods-default-ns" {
  name         = "Pods in default NS"
  data_centers = [checkpoint_management_kubernetes_data_center_server.aks1.name]


    query_rules {
    key_type = "tag"
    key      = "__namespace"
    values   = ["default"]
  }
  lifecycle {
    ignore_changes = [

      query_rules,
    ]
  }
}

resource "checkpoint_management_data_center_query" "superman-default" {
  name         = "Superman(default)"
  data_centers = [checkpoint_management_kubernetes_data_center_server.aks1.name]

  query_rules {
    key_type = "tag"
    key      = "app"
    values   = ["superman"]
  }

    query_rules {
    key_type = "tag"
    key      = "__namespace"
    values   = ["default"]
  }
  lifecycle {
    ignore_changes = [

      query_rules,
    ]
  }
}

resource "checkpoint_management_data_center_query" "webka1-demo-prod" {
  name         = "Webka1(demo) prod"
  data_centers = [checkpoint_management_kubernetes_data_center_server.aks1.name]

  query_rules {
    key_type = "tag"
    key      = "app"
    values   = ["webka1"]
  }
  query_rules {
    key_type = "tag"
    key      = "env"
    values   = ["prod"]
  }
    query_rules {
    key_type = "tag"
    key      = "__namespace"
    values   = ["demo"]
  }
  lifecycle {
    ignore_changes = [

      query_rules,
    ]
  }
}

resource "checkpoint_management_data_center_query" "webka1-demo-test" {
  name         = "Webka1(demo) test"
  data_centers = [checkpoint_management_kubernetes_data_center_server.aks1.name]

  query_rules {
    key_type = "tag"
    key      = "app"
    values   = ["webka1"]
  }
  query_rules {
    key_type = "tag"
    key      = "env"
    values   = ["test"]
  }
    query_rules {
    key_type = "tag"
    key      = "__namespace"
    values   = ["demo"]
  }
  lifecycle {
    ignore_changes = [

      query_rules,
    ]
  }
}

resource "checkpoint_management_data_center_query" "aks1-test-web1" {
  name         = "AKS1 webka1 in test"
  data_centers = [checkpoint_management_kubernetes_data_center_server.aks1.name]

  query_rules {
    key_type = "tag"
    key      = "app"
    values   = ["webka1"]
  }
  query_rules {
    key_type = "tag"
    key      = "env"
    values   = ["test"]
  }
  lifecycle {
    ignore_changes = [

      query_rules,
    ]
  }
}

resource "checkpoint_management_data_center_query" "pods-in-default" {
  name         = "TF pods in default NS"
  data_centers = [checkpoint_management_kubernetes_data_center_server.aks1.name]

  # query_rules {
  #   key_type = "tag"
  #   key      = "app"
  #   values   = ["webka1"]
  # }
  #   query_rules {
  #   key_type = "tag"
  #   key      = "env"
  #   values   = ["prod"]
  # }
  query_rules {
    key_type = "tag"
    key      = "__namespace"
    values   = ["default"]
  }
  lifecycle {
    ignore_changes = [

      query_rules,
    ]
  }
}

resource "checkpoint_management_data_center_query" "aks1-prod-web1b" {
  name         = "AKS1 webka1 in prod"
  data_centers = [checkpoint_management_kubernetes_data_center_server.aks1.name]

  query_rules {
    key_type = "tag"
    key      = "app"
    values   = ["webka1"]
  }
  query_rules {
    key_type = "tag"
    key      = "env"
    values   = ["prod"]
  }
  query_rules {
    key_type = "tag"
    key      = "__namespace"
    values   = ["demo"]
  }
  lifecycle {
    ignore_changes = [

      query_rules,
    ]
  }
}

resource "checkpoint_management_data_center_query" "pavel" {
  name         = "Pavel DCQ"
  data_centers = [checkpoint_management_kubernetes_data_center_server.aks1.name]

  query_rules {
    key_type = "tag"
    key      = "app"
    values   = ["pavel"]
  }
  lifecycle {
    ignore_changes = [

      query_rules,
    ]
  }
}