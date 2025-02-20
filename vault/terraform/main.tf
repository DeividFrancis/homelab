# resource "vault_auth_backend" "kubernetes" {
#   type = "kubernetes"
#   path = "kubernetes"
# }

variable "auth_backend_k8s" {
  description = "vault_auth_backend.kunernetes"
  default     = "kubernetes"
  type        = string
}

variable "pantulab" {
  description = "List of commons apps in pantulab"
  type = list(object({
    name = string
    ns   = string
  }))
  default = [
    { name = "evolution", ns = "evolution" },
    { name = "n8n", ns = "apps" },
    { name = "monitoring", ns = "monitoring" }
  ]
}

resource "vault_policy" "policy" {
  for_each = { for app in var.pantulab : app.name => app }
  name     = "policy-${each.value.name}"
  policy   = file("policies/policy-${each.value.name}.hcl")
}

resource "vault_kubernetes_auth_backend_role" "role" {
  for_each = { for app in var.pantulab : app.name => app }

  backend                          = var.auth_backend_k8s
  role_name                        = "role-${each.value.name}"
  bound_service_account_names      = ["*"]
  bound_service_account_namespaces = [each.value.ns]
  token_ttl                        = 3600
  token_policies                   = [vault_policy.policy[each.key].name]
}

