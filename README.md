# 🏠 CloudLab

# Cluster
- VPS / Contabo 4vCPU, 8GB RAM, 400GB SSD
- k3s

# Registry
- docker.hub

# Network
- cloudflare-tunnel
- traefik ingress controller

# Continuous Deploymet (CD)
- argo-cd

# Monitoring
- prometheus
- grafana
- loki

# Apps
- n8n (lowcode automation)
- evolution-api (whatsapp api)

# Secrets
- Hashcorp Valt 
  - Secrets strategy (vault-agent-inject, vault-csi)
  - Policies and roles provisioned by terraform

# Persistence Volume (PV) / Persistence Volume Claim (PVC)
- local-path (default k3s)