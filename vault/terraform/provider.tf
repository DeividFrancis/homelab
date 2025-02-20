terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "4.6.0"
    }
  }
}

provider "vault" {
  address = "https://vault.pantufasuja.com.br"
  # token = export VAULT_TOKEN="MY-VAULT-TOKEN"
}
