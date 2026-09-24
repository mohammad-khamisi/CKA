helm repo add jetstack https://charts.jetstack.io
helm repo update

kubectl create namespace cert-manager

helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --set crds.enabled=true \
  --set replicaCount=1 \
  --set webhook.replicaCount=1 \
  --set cainjector.replicaCount=1

kubectl get pods -n cert-manager -w
