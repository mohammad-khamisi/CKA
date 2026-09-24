kubectl create secret generic minio-secret \
  --from-literal=AWS_ACCESS_KEY_ID='admin' \
  --from-literal=AWS_SECRET_ACCESS_KEY='ChangeMe123!' \
  --from-literal=AWS_ENDPOINTS='http://minio.minio.svc.cluster.local:9000' \
  -n longhorn-system

Backup and restore --> Backup target
URL: s3://longhorn-backup@us-east-1/
Credential Secret: minio-secret
