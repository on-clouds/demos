variable "project_id" {
}

module "demo-cluster" {
  source            = "github.com/on-clouds/terraform"
  argo_enabled      = false
  cm_enabled        = false
  argo_envs         = []
  cluster_location  = "us-central1-a"
  cluster_name      = "vie-demo-cluster"
  keptn_enabled     = false
  k8sgpt_enabled    = true
  k8sgpt_ai_token   = var.k8sgpt_api_key
  project_id        = var.project_id
  node_count        = 2
  node_machine_type = "e2-highcpu-4"
}


