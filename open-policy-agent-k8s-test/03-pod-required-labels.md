1. Install the required labels constraint template:
   `kubectl apply -f required-labels-constraint-template.yaml`{{execute}}
1. Install the required labels constraint for all namespaced objects in the `default` namespace:
   `kubectl apply -f namespaced-objects-constraint.yaml`{{execute}}
1. Create a pod and show deny
1. Create a pod and show success
1. **CHALLENGE** update the constraint to require another label, `team`
