CLI_ARCH=amd64
curl -L --remote-name-all https://github.com/cilium/cilium-cli/releases/latest/download/cilium-linux-${CLI_ARCH}.tar.gz
tar xzvf cilium-linux-${CLI_ARCH}.tar.gz -C /usr/local/bin
rm cilium-linux-${CLI_ARCH}.tar.gz

cilium version --client

cilium install \
  --set ipam.mode=cluster-pool \
  --set ipam.operator.clusterPoolIPv4PodCIDRList="{192.168.0.0/16}" \
  --set kubeProxyReplacement=false

# enable UI
cilium hubble ui
cilium hubble enable --ui

# enable wireguard
cilium upgrade --set encryption.type=wireguard --set encryption.nodeEncryption=true
