Kubernetes is starting up, it may take a few moments. Once the cluster is ready,
run some commands with `kubectl`:

- `kubectl cluster-info`{{execute}}
- `kubectl version`{{execute}}
- `kubectl get nodes`{{execute}}
- `kubectl get namespaces`{{execute}}
- `kubectl get pods --all-namespaces`{{execute}}


* I tried adding a verifier here like `kubectl get ns` but it wouldn't let me go to the next step so I removed it.