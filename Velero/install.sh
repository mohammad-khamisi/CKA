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

CSI_SNAPSHOT_RELEASE=v8.6.0
CSI_SNAPSHOT_BASE="https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${CSI_SNAPSHOT_RELEASE}"

kubectl apply -f "${CSI_SNAPSHOT_BASE}/client/config/crd/snapshot.storage.k8s.io_volumesnapshotclasses.yaml"
kubectl apply -f "${CSI_SNAPSHOT_BASE}/client/config/crd/snapshot.storage.k8s.io_volumesnapshotcontents.yaml"
kubectl apply -f "${CSI_SNAPSHOT_BASE}/client/config/crd/snapshot.storage.k8s.io_volumesnapshots.yaml"

# صبر کنید هر سه کامل نصب شوند
kubectl wait --for=condition=Established \
  crd/volumesnapshotclasses.snapshot.storage.k8s.io \
  crd/volumesnapshotcontents.snapshot.storage.k8s.io \
  crd/volumesnapshots.snapshot.storage.k8s.io \
  --timeout=90s

kubectl apply -f "${CSI_SNAPSHOT_BASE}/deploy/kubernetes/snapshot-controller/rbac-snapshot-controller.yaml"
kubectl apply -f "${CSI_SNAPSHOT_BASE}/deploy/kubernetes/snapshot-controller/setup-snapshot-controller.yaml"

cat <<EOF | kubectl apply -f -
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshotClass
metadata:
  name: longhorn-snapshot-vsc
  labels:
    velero.io/csi-volumesnapshot-class: "true"
driver: driver.longhorn.io
deletionPolicy: Delete
EOF
