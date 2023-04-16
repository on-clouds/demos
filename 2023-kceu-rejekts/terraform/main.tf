variable "project_id" {
}

module "demo-cluster" {
  source       = "github.com/on-clouds/terraform?ref=v0.0.1"
  argo_enabled = true
  cm_enabled   = true
  argo_envs    = [
    {
      repoUrl = "https://github.com/on-clouds/demos"
      path    = "2023-kceu-rejekts/argo"
      name    = "2023-kceu-rejekts"
    }
  ]
  cluster_location  = "us-central1-a"
  cluster_name      = "kceu-demo-cluster"
  keptn_enabled     = true
  project_id        = var.project_id
  node_count        = 2
  node_machine_type = "e2-highcpu-4"
}


