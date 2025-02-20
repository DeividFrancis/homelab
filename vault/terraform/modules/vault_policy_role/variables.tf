variable "auth_backend_k8s" {
  description = "Vault Auth Backend Kubernetes"
  type        = string
}

variable "pantulab" {
  description = "List of apps commons in Pantulab"
  type = list(object({
    name = string
    ns   = string
  }))
}
