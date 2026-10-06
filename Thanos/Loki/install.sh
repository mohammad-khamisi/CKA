
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm install loki grafana/loki --version 7.3.0 \
  -n monitoring -f values-loki.yaml

  
