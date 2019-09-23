#!/bin/bash

until kubectl cluster-info 2&>/dev/null; do
  echo "Waiting for Kubernetes cluster startup..."
  sleep 5
done

cd /root/k8s

clear

echo "Cluster is ready! Cluster information:"

kubectl cluster-info
kubectl version
kubectl get nodes
