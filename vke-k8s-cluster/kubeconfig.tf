resource "local_file" "kubeconfig" {
    content  = base64decode(vultr_kubernetes.training_cluster.kube_config)
    filename = "tmp/kubeconfig"
}
