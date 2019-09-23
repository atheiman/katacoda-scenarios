1. Launch an nginx deployment:
   `kubectl run nginx --image=nginx`{{execute}}
1. Find the pod:
   `export POD=$(kubectl get pod --selector='run=nginx' --output jsonpath='{.items[0].metadata.name}')`{{execute}}
1. Port forward to the pod:
   `kubectl port-forward --address 0.0.0.0 pod/$POD 80:80`{{execute}}
1. Click the `+` icon at the top of the terminal, and select `View HTTP port 80 on Host 1`
