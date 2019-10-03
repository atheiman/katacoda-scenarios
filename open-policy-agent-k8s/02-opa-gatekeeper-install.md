1. Install Gatekeeper:
   `kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml`{{execute}}


#1. Launch an nginx deployment:
#   `kubectl apply -f nginx-deployment.yaml`{{execute}}
#1. Forward port 8080 of the node to port 80 of the pod:
#   `kubectl port-forward --address 0.0.0.0 deployment/nginx 8080:80`{{execute}}
#1. Access port 8080 of the node in your browser: https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/
