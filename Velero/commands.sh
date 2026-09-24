# بکاپ از namespace پیش‌فرض (شامل longhorn-test-pod و PVCهای تست شما)
velero backup create first-test-backup --include-namespaces default

# وضعیت را دنبال کنید
velero backup describe first-test-backup --details
velero backup logs first-test-backup

kubectl delete pods --all -n default
kubectl delete pvc --all -n default
kubectl delete pv restored-test-vol --ignore-not-found

velero restore create first-test-restore --from-backup first-test-backup
