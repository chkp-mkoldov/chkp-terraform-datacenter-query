
resource "checkpoint_management_access_rule" "webka1-prod" {
  layer    = "${checkpoint_management_package.CPX_Demo.name} Network"
  position = { above = checkpoint_management_access_rule.rule900.id }

  name     = "From Webka1(demo) PROD"
  source   = [checkpoint_management_data_center_query.webka1-demo-prod.name]
  
  enabled            = true
  destination        = ["Any"]
  destination_negate = false
  service            = ["Any"]
  service_negate     = false
  action             = "Accept"
  action_settings = {
    enable_identity_captive_portal = false
  }
  track = {
    accounting              = false
    alert                   = "none"
    enable_firewall_session = true
    per_connection          = true
    per_session             = true
    type                    = "Log"
  }
}

resource "checkpoint_management_access_rule" "superman-in-default" {
  layer    = "${checkpoint_management_package.CPX_Demo.name} Network"
  position = { above = checkpoint_management_access_rule.pods-in-default.id }

  name     = "From SUPERMAN in DEFAULT ns"
  source   = [checkpoint_management_data_center_query.superman-default.name]
  
  enabled            = true
  destination        = ["Any"]
  destination_negate = false
  service            = ["Any"]
  service_negate     = false
  action             = "Accept"
  action_settings = {
    enable_identity_captive_portal = false
  }
  track = {
    accounting              = false
    alert                   = "none"
    enable_firewall_session = true
    per_connection          = true
    per_session             = true
    type                    = "Log"
  }
}

// checkpoint_management_data_center_query" "pods-default-ns" 
resource "checkpoint_management_access_rule" "pods-in-default" {
  layer    = "${checkpoint_management_package.CPX_Demo.name} Network"
  position = { above = checkpoint_management_access_rule.webka1-prod.id }

  name     = "From Pods in DEFAULT ns"
  source   = [checkpoint_management_data_center_query.pods-default-ns.name]
  
  enabled            = true
  destination        = ["Any"]
  destination_negate = false
  service            = ["Any"]
  service_negate     = false
  action             = "Accept"
  # action_settings = {
  #   enable_identity_captive_portal = false
  # }
  track = {
    accounting              = false
    alert                   = "none"
    enable_firewall_session = true
    per_connection          = true
    per_session             = true
    type                    = "Log"
  }
}

resource "checkpoint_management_access_rule" "webka1-test" {
  layer    = "${checkpoint_management_package.CPX_Demo.name} Network"
  position = { above = checkpoint_management_access_rule.webka1-prod.id }

  name     = "From Webka1(demo) TEST"
  source   = [checkpoint_management_data_center_query.webka1-demo-test.name]
  
  enabled            = true
  destination        = ["Any"]
  destination_negate = false
  service            = ["Any"]
  service_negate     = false
  action             = "Accept"
  action_settings = {
    enable_identity_captive_portal = false
  }
  track = {
    accounting              = false
    alert                   = "none"
    enable_firewall_session = true
    per_connection          = true
    per_session             = true
    type                    = "Log"
  }
}


resource "checkpoint_management_access_rule" "rule900" {
  layer    = "${checkpoint_management_package.CPX_Demo.name} Network"
  //position = { below = checkpoint_management_access_rule.rule130.id }
  position = { top = "top" }
  name     = "Logger from VNET"
  source   = [checkpoint_management_network.vnet.name]
  #source = [checkpoint_management_host.host6.name]
  enabled            = true
  destination        = ["Any"]
  destination_negate = false
  service            = ["Any"]
  service_negate     = false
  action             = "Accept"
  action_settings = {
    enable_identity_captive_portal = false
  }
  track = {
    accounting              = false
    alert                   = "none"
    enable_firewall_session = true
    per_connection          = true
    per_session             = true
    type                    = "Log"
  }
}
resource "checkpoint_management_access_rule" "rule902" {
  layer = "${checkpoint_management_package.CPX_Demo.name} Network"
  #position = {bottom = "bottom"}
  position = { below = checkpoint_management_access_rule.rule900.id }
  name     = "Logger to VNET."
  source   = ["Any"]
  #source = [checkpoint_management_host.host6.name]
  enabled            = true
  destination        = [checkpoint_management_network.vnet.name]
  destination_negate = false
  service            = ["Any"]
  service_negate     = false
  action             = "Accept"
  action_settings = {
    enable_identity_captive_portal = false
  }
  track = {
    accounting              = false
    alert                   = "none"
    enable_firewall_session = true
    per_connection          = true
    per_session             = true
    type                    = "Log"
  }
}