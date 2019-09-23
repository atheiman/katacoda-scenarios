Kubernetes is starting up, it may take a few moments. You can wait for it to start with:

- `until kubectl cluster-info; do sleep 10; done`{{execute}}

Run some commands with `kubectl`:

- `kubectl cluster-info`{{execute}}
- `kubectl version`{{execute}}
- `kubectl get nodes`{{execute}}
- `kubectl get namespaces`{{execute}}
