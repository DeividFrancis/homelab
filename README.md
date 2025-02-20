# 🏠☁️ CloudLab

### Cluster
- VPS / Contabo 4vCPU, 8GB RAM, 400GB SSD
- k3s

### Folder structure
- `/argocd` - Applications manifests
- `/charts` - Custom helm charts ()
- `/k8s` - Simples vanilla kubernetes manifests
- `/stand-by` - Deprecated / comming son k8s projets 
- `/terraform` - IaC for Vault configs

### Registry
- docker.hub

### Network
- cloudflare-tunnel
- traefik ingress controller

### Continuous Deploymet (CD)
- argo-cd

### Monitoring
- prometheus
- grafana
- loki

### Apps
- n8n (lowcode automation)
- evolution-api (whatsapp api)

### Secrets
- Hashcorp Valt 
  - Secrets strategy (vault-agent-inject, vault-csi)
  - Policies and roles provisioned by terraform

### Persistence Volume (PV) / Persistence Volume Claim (PVC)
- local-path (default k3s)