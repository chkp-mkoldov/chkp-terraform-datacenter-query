# resource "checkpoint_management_network" "network1" {
#   name = "network1"
#   subnet4 = "1.2.3.0"
#   mask_length4 = 24
#   color = "blue"
#   nat_settings = {
#     auto_rule = false
#   }
# }

# resource "checkpoint_management_network" "network2" {
#   name = "network2"
#   subnet4 = "2.2.3.0"
#   mask_length4 = 24
#   color = "red"
#   nat_settings = {
#     auto_rule = false
#   }
# }

# resource "checkpoint_management_network" "network3" {
#   name = "network3"
#   subnet4 = "3.2.3.0"
#   mask_length4 = 24
#   color = "sea green"
#   nat_settings = {
#     auto_rule = false
#   }
# }

# resource "checkpoint_management_network" "network4" {
#   name = "network4"
#   subnet4 = "4.2.3.0"
#   mask_length4 = 24
#   color = "pink"
#   nat_settings = {
#     auto_rule = false
#   }
# }

# resource "checkpoint_management_network" "network5" {
#   name = "network5"
#   subnet4 = "5.2.3.0"
#   mask_length4 = 24
#   color = "orange"
#   nat_settings = {
#     auto_rule = false
#   }
# }

resource "checkpoint_management_network" "net-linux" {
  name         = "net-linux"
  subnet4      = "10.42.5.0"
  mask_length4 = 24
  #color = "green"
  ignore_warnings = true
  nat_settings = {
    auto_rule = false
  }
}

resource "checkpoint_management_network" "net-aks1" {
  name         = "net-aks1"
  subnet4      = "10.42.1.0"
  mask_length4 = 24
  #color = "green"
  ignore_warnings = true
  nat_settings = {
    auto_rule = false
  }
}


resource "checkpoint_management_network" "vnet" {
  name         = "vnet"
  subnet4      = "10.0.0.0"
  mask_length4 = 8
  #color = "green"
  ignore_warnings = true
  nat_settings = {
    auto_rule = false
  }
}