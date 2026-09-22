kubectl run entity-test --image=curlimages/curl --command -- sleep 3600

kubectl exec entity-test -- curl -sk -o /dev/null -w "kube-apiserver -> HTTP:%{http_code}\n" https://kubernetes.default.svc
kube-apiserver -> HTTP:403 # (یعنی وصل شد، فقط اجازهٔ ادمین نداریم)
kubectl exec entity-test -- curl -s -o /dev/null -w "example.com    -> HTTP:%{http_code}\n" https://example.com
example.com    -> HTTP:200
