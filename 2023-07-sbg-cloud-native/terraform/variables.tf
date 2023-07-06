######################################################################################################
############################################## Exoscale ##############################################
######################################################################################################

variable "key" {
  description = "Exoscale API key"
  type        = string
  #sensitive   = true
}
variable "secret" {
  description = "Exoscale API secret"
  type        = string
  sensitive   = true
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "demo"
}

variable "sks_version" {
  description = "SKS version"
  default     = "1.26.4"
  type        = string
}

variable "service_level" {
  description = "SLA level of the SKS cluster"
  default     = "starter"
  type        = string

  validation {
    condition     = contains(["starter", "pro"], var.service_level)
    error_message = "Unknown service level. Only starter and pro available."
  }
}

variable "nodepools" {
  description = "Definitions of nodepools"
  type = map(object({
    instance_type = string
    size          = number
    disk_size     = number
    enabled       = bool
    labels        = map(string)
    taints        = map(string)
  }))
}

variable "network_plugin" {
    description = "Network plugin to use"
    default     = "cilium"
    type        = string

    validation {
        condition     = contains(["calico", "cilium"], var.network_plugin)
        error_message = "Unknown network plugin. Only calico and cilium available."
    }
}