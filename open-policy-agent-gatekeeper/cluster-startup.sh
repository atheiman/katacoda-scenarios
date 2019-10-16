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
