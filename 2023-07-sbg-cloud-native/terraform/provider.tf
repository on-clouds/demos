provider "exoscale" {
  key    = var.key
  secret = var.secret
}

provider "helm" {
  kubernetes {
    config_path = module.sks_cluster.kubeconfig_path
  }
}

locals {
  zone = "at-vie-1"
}
