helm install monitoring . -n monitoring -f loki-stack-values.yaml -f grafana-agent-values.yaml --create-namespace


helm upgrade monitoring . -n monitoring -f loki-stack-values.yaml -f grafana-agent-values.yaml
