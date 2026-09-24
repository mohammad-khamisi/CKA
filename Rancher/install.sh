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

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo update

kubectl create namespace cattle-system

helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --set hostname=rancher.172.28.100.203.nip.io \
  --set bootstrapPassword=ChangeMe123! \
  --set replicas=1 \
  --set ingress.enabled=false

kubectl get pods -n cattle-system -w
















