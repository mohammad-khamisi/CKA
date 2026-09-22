kubectl exec client-allowed -- curl -s -o /dev/null -w "HTTP:%{http_code}\n" nginx.default.svc.cluster.local
kubectl exec client-blocked -- curl -s -o /dev/null -w "HTTP:%{http_code}\n" nginx.default.svc.cluster.local
