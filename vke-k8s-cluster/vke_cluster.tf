resource "vultr_kubernetes" "training_cluster" {
   region = "fra"
   label  = "training-cluster"
   version = "v1.31.5+1"

   node_pools {
       node_quantity = 3
       plan = "vc2-2c-4gb"
       label = "training-node"
       auto_scaler = true
       min_nodes = 3
       max_nodes = 3    
   }
}
