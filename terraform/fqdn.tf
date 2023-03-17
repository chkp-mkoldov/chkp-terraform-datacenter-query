resource "checkpoint_management_dns_domain" "ipconfig" {
  name          = ".ipconfig.me"
  is_sub_domain = true
}

resource "checkpoint_management_dns_domain" "ifconfig" {
  name          = ".ifconfig.me"
  is_sub_domain = true
}

resource "checkpoint_management_dns_domain" "ip-iol" {
  name          = ".ip.iol.cz"
  is_sub_domain = true
}