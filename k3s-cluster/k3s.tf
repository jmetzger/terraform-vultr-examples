module "k3s" {
  # source = "./../.."
  # use github source instead 
  source = "github.com/jmetzger/terraform-module-k3s"  

  depends_on_    = vultr_instance.node_instances
  k3s_version    = "latest"
  cluster_domain = "do_k3s"

  drain_timeout            = "60s"
  managed_fields           = ["label"]
  generate_ca_certificates = true

  global_flags = [for instance in vultr_instance.node_instances : "--tls-san ${instance.main_ip} --disable=servicelb --disable=traefik"]

  servers = {
    # The node name will be automatically provided by
    # the module using the field name... any usage of
    # --node-name in additional_flags will be ignored

    for instance in vultr_instance.node_instances :
    instance.id => {
      ip = instance.main_ip
      connection = {
        timeout     = "60s"
        type        = "ssh"
        host        = instance.ipv4_address
        private_key = trimspace(tls_private_key.ed25519_provisioning.private_key_pem)
      }

      labels = { "node.kubernetes.io/type" = "master" }
    }
  }
}
