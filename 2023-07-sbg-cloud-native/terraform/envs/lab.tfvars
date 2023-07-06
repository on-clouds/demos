project     = "demo"

network_plugin = "cilium"

sks_version = "1.26.6"

nodepools = {
  "default" = {
    instance_type = "standard.medium"
    size          = 2
    disk_size     = 20
    enabled       = true
    labels        = {}
    taints        = {}
  }
}