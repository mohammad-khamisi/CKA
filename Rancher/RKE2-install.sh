# روی سرور Master/Control Plane
curl -sfL https://get.rke2.io | sh -
systemctl enable rke2-server.service
systemctl start rke2-server.service

# بررسی وضعیت
systemctl status rke2-server.service

# دسترسی به kubectl
export KUBECONFIG=/etc/rancher/rke2/rke2.yaml
export PATH=$PATH:/var/lib/rancher/rke2/bin
kubectl get nodes


┌─────────────────────────────────┐
│   Management Cluster (RKE2)     │
│   ┌───────────────────────┐     │
│   │   Rancher (running)   │     │
│   └───────────────────────┘     │
└──────────────┬──────────────────┘
               │  (فقط ارتباط API / Agent)
     ┌─────────┼─────────┬──────────────┐
     │         │         │              │
┌────▼───┐ ┌───▼────┐ ┌──▼─────┐  ┌─────▼─────┐
│cluster-1│ │cluster-2││cluster-3││cluster-4  │
│ (K3s)   │ │ (RKE2)  ││ (EKS)   ││ (on-prem) │
│ مستقل   │ │ مستقل   │ │ مستقل   │  │ مستقل     │
└────────┘ └────────┘ └────────┘  └───────────┘
