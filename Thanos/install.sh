kubectl create namespace monitoring

cat > objstore.yml <<'EOF'
type: S3
config:
  bucket: prometheus-thanos-khamisi
  endpoint: s3.YOUR_REGION.amazonaws.com
  region: YOUR_REGION
  access_key: YOUR_ACCESS_KEY
  secret_key: YOUR_SECRET_KEY
EOF

kubectl -n monitoring create secret generic thanos-objstore \
  --from-file=objstore.yml=./objstore.yml

# فایل کلید را از دیسک پاک کنید
rm -f objstore.yml

#--------------------------------------------------------------------------------

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install kps prometheus-community/kube-prometheus-stack \
  -n monitoring -f values-kps.yaml

kubectl -n monitoring get pods -w
#--------------------------------------------------------------------------------
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm repo update

helm install thanos stevehipwell/thanos --version 1.24.1 \
  -n monitoring -f values-thanos.yaml

kubectl -n monitoring get pods
kubectl -n monitoring get svc | grep thanos
#--------------------------------------------------------------------------------
ssh -t -i my-key-univ.pem \
  -L 3000:localhost:3000 \
  -L 10902:localhost:10902 \
  -L 9090:localhost:9090 \
  ubuntu@172.28.100.203 \
  "sudo kubectl port-forward -n monitoring svc/kps-grafana 3000:80 --address localhost & sudo kubectl port-forward -n monitoring svc/thanos-query 10902:10902 --address localhost & sudo kubectl port-forward -n monitoring svc/kps-prometheus 9090:9090 --address localhost & wait"
