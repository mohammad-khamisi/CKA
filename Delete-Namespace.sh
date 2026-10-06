# Delete ns on "Terminating" status
NS=my-namespace
kubectl get ns $NS -o json \
  | jq '.spec.finalizers = []' \
  | kubectl replace --raw "/api/v1/namespaces/$NS/finalize" -f -
