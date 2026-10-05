cmctl check api
kubectl get deployment -n cnpg-system cnpg-controller-manager \
  -o jsonpath="{.spec.template.spec.containers[*].image}"

helm repo add cnpg https://cloudnative-pg.github.io/charts --force-update
helm upgrade --install plugin-barman-cloud \
  --namespace cnpg-system \
  cnpg/plugin-barman-cloud

kubectl -n cnpg-system rollout status deploy/plugin-barman-cloud

kubectl create secret generic object-store \
  --from-literal=ACCESS_KEY_ID=CHANGE_ME \
  --from-literal=ACCESS_SECRET_KEY=CHANGE_ME

