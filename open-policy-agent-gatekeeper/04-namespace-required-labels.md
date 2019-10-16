1. Install the required labels constraint for Namespaces, ClusterRoles, non-namespaced objects in the `default` namespace:
   `kubectl apply -f namespaced-objects-constraint.yaml`{{execute}}
1. Create a namespace and show deny
1. Create a namespace and show success
1. **CHALLENGE** update the constraint to require another label, `team`
