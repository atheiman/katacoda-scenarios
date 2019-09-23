1. Launch an nginx deployment:
   `kubectl run nginx --image=nginx`{{execute}}
1. Find the pod:
   `export POD=$(kubectl get pod --selector='run=nginx' --output jsonpath='{.items[0].metadata.name}')`{{execute}}
1. Forward port 8080 of the node to port 80 of the pod:
   `kubectl port-forward --address 0.0.0.0 pod/$POD 8080:80`{{execute}}
1. Access port 8080 of the node in your browser: https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/
