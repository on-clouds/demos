module "argocd" {
  source       = "../../../terraform/kubernetes-addons/argocd"
  argo_enabled = true
  argo_envs = [
    {
      repoUrl        = "https://github.com/on-clouds/demos"
      path           = "2023-07-sbg-cloud-native/gitops"
      name           = "platform"
      targetRevision = "HEAD"
    }
  ]

  argo_private_repos = []

  depends_on = [
    module.sks_cluster
  ]
}