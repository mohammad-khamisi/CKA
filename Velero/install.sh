VELERO_VERSION=$(curl -s https://api.github.com/repos/vmware-tanzu/velero/releases/latest | grep tag_name | cut -d '"' -f4)
curl -L -o velero.tar.gz "https://github.com/vmware-tanzu/velero/releases/download/${VELERO_VERSION}/velero-${VELERO_VERSION}-linux-amd64.tar.gz"
tar -xvf velero.tar.gz
mv velero-${VELERO_VERSION}-linux-amd64/velero /usr/local/bin/
rm -rf velero.tar.gz velero-${VELERO_VERSION}-linux-amd64

velero version --client-only

cat <<EOF > credentials-velero
[default]
aws_access_key_id=admin
aws_secret_access_key=ChangeMe123!
EOF
