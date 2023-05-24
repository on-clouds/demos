variable "project_id" {
}

module "demo-cluster" {
  source       = "../../../terraform"
  argo_enabled = true
  cm_enabled   = true
  argo_envs    = [
    {
      repoUrl = "https://github.com/on-clouds/demos"
      path    = "2023-devopspro/argo"
      name    = "2023-devopspro"
      revision = "master"
    }
  ]
  cluster_location  = "us-central1-a"
  cluster_name      = "vie-demo-cluster"
  keptn_enabled     = false
  k8sgpt_enabled    = true
  k8sgpt_ai_token   = var.k8sgpt_api_key
  project_id        = var.project_id
  node_count        = 2
  node_machine_type = "e2-highcpu-4"
}


