https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-secret-store-driver


helm dependency build

helm install --dry-run --debug evolution .

helm upgrade --install evolution -n evolution .

helm template evolution . -s templates/deployment.yaml

kubectl get pod evolution-deployment-99d5df49d-xn65v -o jsonpath='{.spec.containers[*].command}'
