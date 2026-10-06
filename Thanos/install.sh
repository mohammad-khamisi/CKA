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


helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install kps prometheus-community/kube-prometheus-stack \
  -n monitoring -f values-kps.yaml

kubectl -n monitoring get pods -w
