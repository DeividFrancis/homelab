output "policy_names" {
  value = { for app in var.pantulab : app.name => vault_policy.policy[app.name].name }
}

output "role_names" {
  value = { for app in var.pantulab : app.name => vault_kubernetes_auth_backend_role.role[app.name].role_name }
}
