helm repo add awx-operator https://ansible-community.github.io/awx-operator-helm/
helm repo update
helm search repo awx-operator/awx-operator --versions | head -5

helm install awx-operator awx-operator/awx-operator \
  -n awx --create-namespace \
  --version <CHART_VERSION(3.2.1)> \
  -f awx-values.yaml

kubectl -n awx get pods -w
