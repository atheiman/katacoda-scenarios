1. Install the required labels constraint template:
   `kubectl apply -f pod-required-labels-constraint-template.yaml`{{execute}}
1. Install the required labels constraint for all namespaced objects in the `default` namespace:
   `kubectl apply -f pod-required-labels-constraint.yaml`{{execute}}
1. Create a pod and show deny
    `kubectl apply -f pod-required-labels-deny.yaml`{{execute}}
1. Create a pod and show success
    `kubectl apply -f pod-required-labels-allow.yaml`{{execute}}
1. **CHALLENGE** update the constraint to require another label, `team`
    **NOTE** - It looks like you need to delete the constraint and recreate it if you want to change the labels. I tried replacing owner with team and then tried adding team in addition to owner, both failed until I deleted and recreated the resource