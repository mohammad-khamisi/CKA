kubectl create ns admin-ns
kubectl create ns ns-a
kubectl create ns ns-b

# هدف در ns-a
kubectl run nginx-a -n ns-a --image=nginx:alpine --labels=app=nginx
kubectl expose pod nginx-a -n ns-a --port=80

# هدف در ns-b
kubectl run nginx-b -n ns-b --image=nginx:alpine --labels=app=nginx
kubectl expose pod nginx-b -n ns-b --port=80

# کلاینت مجاز (در namespace کاملاً جدا)
kubectl run admin-client -n admin-ns --image=curlimages/curl --labels=role=admin --command -- sleep 3600

# کلاینت غیرمجاز، حتی داخل همان ns-a که nginx-a هست
kubectl run random-client -n ns-a --image=curlimages/curl --command -- sleep 3600

kubectl exec -n admin-ns admin-client -- curl -s -o /dev/null -w "admin->nginx-a: %{http_code}\n" nginx-a.ns-a.svc.cluster.local
admin->nginx-a: 200
kubectl exec -n admin-ns admin-client -- curl -s -o /dev/null -w "admin->nginx-b: %{http_code}\n" nginx-b.ns-b.svc.cluster.local
admin->nginx-b: 200
kubectl exec -n ns-a random-client -- curl -s -o /dev/null -w "random->nginx-a: %{http_code}\n" nginx-a.ns-a.svc.cluster.local
random->nginx-a: 200
