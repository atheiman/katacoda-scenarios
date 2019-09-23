#!/bin/bash

until kubectl cluster-info 2&>1; do
  echo "Waiting for Kubernetes cluster startup..."
  sleep 5
done

clear

echo "Cluster is ready! Cluster information:"
kubectl cluster-info
kubectl version
kubectl nodes
