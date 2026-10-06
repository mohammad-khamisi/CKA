
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm install loki grafana/loki --version 7.3.0 \
  -n monitoring -f values-loki.yaml

helm install alloy grafana/alloy --version 1.13.0 \
  -n monitoring -f values-alloy.yaml

kubectl -n monitoring get pods
kubectl -n monitoring logs deploy/alloy --tail=20

helm upgrade kps prometheus-community/kube-prometheus-stack \
  -n monitoring -f values-kps.yaml -f values-kps-loki.yaml
