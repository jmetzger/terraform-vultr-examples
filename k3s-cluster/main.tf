# 2284 - ubuntu 24.04 
resource "vultr_instance" "node_instances" {
    
    count = 3
    label = "k3s-node${count.index}"
    plan = "vc2-1c-1gb"
    region = "fra"
    os_id = "2284"
    ssh_key_ids = [vultr_ssh_key.default.id] 
    
}

resource "tls_private_key" "ed25519_provisioning" {
  algorithm = "ED25519"
}

resource "vultr_ssh_key" "default" {
  name       = "K3S terraform module - Provisionning SSH key"
  ssh_key = trimspace(tls_private_key.ed25519_provisioning.public_key_openssh)
}

