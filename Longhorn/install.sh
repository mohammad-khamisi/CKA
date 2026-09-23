# both master & worker
apt update
apt install -y open-iscsi nfs-common
systemctl enable --now iscsid
systemctl status iscsid --no-pager

# master
# نصب helm اگر ندارید
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# افزودن ریپازیتوری رسمی Longhorn
helm repo add longhorn https://charts.longhorn.io
helm repo update

# نصب با تنظیم replica پیش‌فرض روی 2 (متناسب با کلاستر دونودی شما)
helm install longhorn longhorn/longhorn \
  --namespace longhorn-system \
  --create-namespace \
  --set defaultSettings.defaultReplicaCount=2

kubectl get pods -n longhorn-system -w

root@master:~# kubectl get nodes.longhorn.io -n longhorn-system
NAME     READY   ALLOWSCHEDULING   SCHEDULABLE   AGE
master   True    true              True          5m8s
worker   True    true              True          5m5s
root@master:~# kubectl get storageclass
NAME                 PROVISIONER          RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
longhorn (default)   driver.longhorn.io   Delete          Immediate           true                   5m43s
longhorn-static      driver.longhorn.io   Delete          Immediate           true                   5m40s
