resource "vultr_kubernetes" "training_cluster" {
   region = "fra"
   label  = "training-cluster"
   version = "v1.32.1+1"

   node_pools {
       node_quantity = 3
       plan = "vc2-2c-4gb"
       label = "training-node"
       auto_scaler = false
   }
}
