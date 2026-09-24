# بکاپ از namespace پیش‌فرض (شامل longhorn-test-pod و PVCهای تست شما)
velero backup create first-test-backup --include-namespaces default

# وضعیت را دنبال کنید
velero backup describe first-test-backup --details
velero backup logs first-test-backup


