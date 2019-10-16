# Mutating admissions controller

Delete the previously deployed Gatekeeper Constraints so we don't have conflicts in this exercise:

```
k delete -n default constraints.gatekeeper.sh RequiredLabels
k delete -n default constraints.gatekeeper.sh WhitelistedRegistry
```{{execute}}

The previous two exercises demonstrated the power of validating admissions controllers that will reject resources that do not meet the policy specified by the Gatekeeper ConstraintTemplate. OPA Gatekeeper currently does not support generating Mutating admissions controllers based on ConstraintTemplates but to demonstrate a working example, we will use a simple REST API (Ruby Sinatra app) running in the Kubernetes cluster.

Similar to Validating admissions controllers, Mutating admissions controllers can be configured to be notified when specific events happen in the cluster like a CREATE or UPDATE. Instead of returning a yes or no response to the Kubernetes API, a Mutating admissions controller will return a [JSON patch](http://jsonpatch.com/) object that will tell Kubernetes how to modify the incoming resource.

This example will show how we can modify a submitted pod to add a label after it has been submitted to the cluster. This pattern can be extended to a number of other applications like injecting environment variables, adding side car containers, generating/injecting TLS certificates automatically, and so on. This is a powerful pattern for providing sane defaults to cluster consumers without placing the burden on those users to know how or what to implement for this type of information.

To get started, we first need to create a namespace for our mutating webhook: `kubectl create ns sinatra-mutating-webhook`{{execute}}

Kubernetes requires all admissions controllers to communicate over TLS so we need to generate a Certificate Signing Request that will be signed by the Kubernetes cluster certificate authority that will then be used by our REST api.

To simplify this, run the following to generate, sign, and upload a certificate to be used: `title="sinatra-mutating-webhook" ./gen-cert.sh`{{execute}}

Before we upload our Mutating Webhook, we need to include the Kubernetes cluster CA bundle in our configuration:

```
ca_bundle=$(kubectl get configmap -n kube-system extension-apiserver-authentication -o=jsonpath='{.data.client-ca-file}' | base64 | tr -d '\n')
sed -i -e "s/CA_BUNDLE_HERE/$ca_bundle/g" mutating-webhook.yaml
```{{execute}}

Now we can upload our Mutating Webhook to start receiving updates from the Kubernetes API: `kubectl apply -f mutating-webhook.yaml`{{execute}}

Wait for our mutating webhook to become ready: `kubectl wait -n sinatra-mutating-webhook pod --all --for=condition=Ready`{{execute}}

Finally, to see this working in action we can upload some pods to see it adding a label to each pod _unless_ they specify a specific annotation to skip attaching a label: `kubectl apply -f mutating-webhook-pod-test.yaml`{{execute}}

Run the following to see which pods were mutated by having a `fun` label attached. Notice that the `excluded` pod was skipped since it had a `mutating-webhook.example.com/exclude` annotation on it: `kubectl get po -n sinatra-mutating-webhook-test --show-labels`{{execute}}

You can also view the logs of our Mutating Webhook to view the response object returned to the Kubernetes API.

Finally, feel free to view the sample REST api code by inspecting `mutating_webhook.rb` to see the logic behind this example or to extend it if you are familiar with Ruby/Sinatra.

Credit for this mutating webhook goes to Austin Heiman with the code located [here](https://github.com/atheiman/kubernetes/tree/master/sinatra-mutating-webhook).
