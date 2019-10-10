#!/bin/bash

until kubectl cluster-info 2&>/dev/null; do
  echo "Waiting for Kubernetes cluster startup..."
  sleep 5
done

kubectl wait node --all --for=condition=Ready --timeout=3m

source <(kubectl completion bash)

cd /root/k8s

# Install kubectx/kubens.
git clone https://github.com/ahmetb/kubectx /opt/kubectx
ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
ln -s /opt/kubectx/kubens /usr/local/bin/kubens

clear

echo "Cluster is ready! Cluster information:"

kubectl cluster-info
kubectl version --short

# # kubeadm upgrade instructions from
# # https://v1-15.docs.kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade-1-15/
# apt-get update -qy
# # search for available versions: apt-cache policy kubeadm
# TARGET_KUBE_VERSION="1.15.4"

# # download latest binaries
# apt-mark unhold kubeadm kubelet kubectl
# apt-get install -qy kubeadm=${TARGET_KUBE_VERSION}-00 kubelet=${TARGET_KUBE_VERSION}-00 kubectl=${TARGET_KUBE_VERSION}-00
# apt-mark hold kubeadm kubelet kubectl

# # upgrade master
# kubeadm upgrade plan
# kubeadm upgrade apply --yes v${TARGET_KUBE_VERSION}

# # restart kubelet on master
# systemctl restart kubelet
