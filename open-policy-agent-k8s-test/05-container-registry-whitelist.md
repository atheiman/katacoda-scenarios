1. Install the container registry whitelist constraint template:
   `kubectl apply -f registry-whitelist-constraint-template.yaml`{{execute}}
1. Install the gcr.io container registry whitelist constrain to require containers to be pulled from the gcr.io trusted container registry:
   `kubectl apply -f registry-whitelist-constraint.yaml`{{execute}}
1. Create a deployment and show deny
1. Create a deployment and show success
1. **CHALLENGE** update the constraint to permit another label container source, quay.io
