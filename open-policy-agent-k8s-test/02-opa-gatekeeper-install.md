1. Install Gatekeeper:
   `kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml`{{execute}}
1.

kubectl wait statefulset -n gatekeeper-system --all --for=condition=Ready --timeout=3m


** Need verifier for gatekeeper install **
