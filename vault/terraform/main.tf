module "vault_policy_role" {
  source = "./modules/vault_policy_role"

  auth_backend_k8s = "kubernetes"
  pantulab = [
    { name = "evolution", ns = "evolution" },
    { name = "n8n", ns = "apps" },
    { name = "monitoring", ns = "monitoring" },
    { name = "cloudflare", ns = "network" }
  ]
}
