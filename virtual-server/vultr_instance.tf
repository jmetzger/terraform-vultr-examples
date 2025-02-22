# 2284 - ubuntu 24.04 
resource "vultr_instance" "my_instance" {
    label = "sample-server"
    plan = "vc2-1c-1gb"
    region = "fra"
    os_id = "2284"
    enable_ipv6 = true
}
