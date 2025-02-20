  helm upgrade --install plane-app plane/plane-enterprise \
        --create-namespace \
        --namespace plane \
        --set planeVersion=v1.6.0 \
        --set ingress.enabled=true \
        --set ingress.ingressClass=treafik \
        --set env.storageClass=longhorn \
        --timeout 10m \
        --wait \
        --wait-for-jobs