terraform {
  required_version = ">= 1.0.0"

  required_providers {
    exoscale = {
      source  = "exoscale/exoscale"
      version = "0.49.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}
