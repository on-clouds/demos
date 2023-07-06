locals {
  global_prefix = "${var.project}-${terraform.workspace}"

  default_nodepool_name = "default"
}