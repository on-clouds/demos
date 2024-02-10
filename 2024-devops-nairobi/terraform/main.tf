variable "project_id" {
  default = "thschue-demos"
}

module "demo-cluster" {
  source       = "github.com/on-clouds/terraform"
  argo_enabled = true
  cm_enabled   = false
  argo_envs = [
    {
      repoUrl = "https://github.com/on-clouds/demos"
      path    = "2024-devops-nairobi/argo"
      name    = "2024-devops-nairobi"
    }
  ]
  cluster_location  = "us-central1-a"
  cluster_name      = "devops-nairobi-demo-cluster"
  keptn_enabled     = true
  project_id        = var.project_id
  node_count        = 2
  node_machine_type = "e2-highcpu-4"
}


