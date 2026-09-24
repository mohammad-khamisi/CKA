VELERO_VERSION=$(curl -s https://api.github.com/repos/velero-io/velero/releases/latest | grep tag_name | cut -d '"' -f4)
echo $VELERO_VERSION"

curl -L -o velero.tar.gz "https://github.com/velero-io/velero/releases/download/${VELERO_VERSION}/velero-${VELERO_VERSION}-linux-amd64.tar.gz"
tar -xvf velero.tar.gz
mv velero-${VELERO_VERSION}-linux-amd64/velero /usr/local/bin/
rm -rf velero.tar.gz velero-${VELERO_VERSION}-linux-amd64

velero version --client-only

cat <<EOF > credentials-velero
[default]
aws_access_key_id=admin
aws_secret_access_key=ChangeMe123!
EOF

velero install \
  --provider aws \
  --plugins velero/velero-plugin-for-aws:v1.11.0 \
  --bucket velero-backup \
  --secret-file ./credentials-velero \
  --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://minio.minio.svc.cluster.local:9000 \
  --use-node-agent \
  --features=EnableCSI
