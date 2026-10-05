helm repo add awx-operator https://ansible-community.github.io/awx-operator-helm/
helm repo update
helm search repo awx-operator/awx-operator --versions | head -5

helm install awx-operator awx-operator/awx-operator \
  -n awx --create-namespace \
  --version <CHART_VERSION(3.2.1)> \
  -f awx-values.yaml

kubectl -n awx get pods -w

kubectl -n awx get secret awx-demo-admin-password -o jsonpath='{.data.password}' | base64 -d; echo

ssh -i my-key-univ.pem -L 8080:localhost:8080 ubuntu@172.28.100.203 "sudo kubectl port-forward -n awx svc/awx-demo-service 8080:80 --address localhost"

