module "sks_cluster" {
  source                 = "../../../terraform/cluster/sks"
  cluster_name           = "${local.global_prefix}-sks"
  node_pools             = var.nodepools
  anti_affine_node_pools = {}
  zone                   = local.zone
  network_plugin         = var.network_plugin
  cluster_version        = var.sks_version
  kubeconfig_path        = "~/.kube/config.d/whizus/demos/${local.global_prefix}-sks.config.yaml"
}
