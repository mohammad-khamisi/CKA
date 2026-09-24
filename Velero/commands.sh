# بکاپ از namespace پیش‌فرض (شامل longhorn-test-pod و PVCهای تست شما)
velero backup create first-test-backup --include-namespaces default

# وضعیت را دنبال کنید
velero backup describe first-test-backup --details
velero backup logs first-test-backup

kubectl delete pods --all -n default
kubectl delete pvc --all -n default
kubectl delete pv restored-test-vol --ignore-not-found

velero restore create first-test-restore --from-backup first-test-backup

velero backup get

--------------------------------------------
# هر روز ساعت ۲ بامداد، از namespace پیش‌فرض، با نگه‌داری ۷ روزه
velero schedule create daily-default-backup \
  --schedule="0 2 * * *" \
  --include-namespaces default \
  --ttl 168h0m0s

# هر ساعت (برای تست سریع‌تر)
velero schedule create hourly-test \
  --schedule="@every 1h" \
  --include-namespaces default \
  --ttl 24h0m0s

# مثال ترکیبی
velero backup create app-only-backup \
  --include-namespaces default \
  --selector app=nginx \
  --ttl 72h0m0s

# یک Schedule هر ۱۰ دقیقه برای تست سریع
velero schedule create every-10-min-test \
  --schedule="*/10 * * * *" \
  --include-namespaces default \
  --ttl 2h0m0s



