1. Install the container registry whitelist constraint template:
   `kubectl apply -f registry-whitelist-constraint-template.yaml`{{execute}}
1. Install the quay.io container registry whitelist constraint to require containers to be pulled from the quay.io trusted container registry:
   `kubectl apply -f registry-whitelist-constraint.yaml`{{execute}}
1. Create a pod and show deny: `kubectl apply -f registry-whitelist-deny.yaml`{{execute}}
1. Create a pod and show success: `kubectl apply -f registry-whitelist-allow.yaml`{{execute}}

## CHALLENGE

Update the constraint to permit another container registry source, gcr.io
