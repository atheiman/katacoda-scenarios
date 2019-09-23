1. Launch an nginx deployment:
   `kubectl run nginx --image=nginx`{{execute}}
1. Port forward to the pod:
   `kubectl port-forward --address 0.0.0.0 pod/nginx-7db9fccd9b-bqw88 80:80`
1. Click the + icon at the top of the terminal, and select `View HTTP port 80 on Host 1`
