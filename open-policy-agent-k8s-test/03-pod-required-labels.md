1. Install the required labels constraint template:
   `kubectl apply -f required-labels-template.yaml`{{execute}}
1. Install the required labels constraint for all namespaced objects in the `default` namespace:
   `kubectl apply -f required-labels-constraint.yaml`{{execute}}
1. Create a pod and show deny
    `kubectl apply -f required-labels-deny.yaml`{{execute}}
1. Create a pod and show success
    `kubectl apply -f required-labels-allow.yaml`{{execute}}
1. **CHALLENGE** update the `required-lables-constraint.yaml` to require another label `team` and re-submit a pod with the added label.
