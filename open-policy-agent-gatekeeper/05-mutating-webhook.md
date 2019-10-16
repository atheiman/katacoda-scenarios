# Mutating admissions controller

The previous two exercises demonstrated the power of validating admissions controllers that will reject resources that do not meet the policy specified by the Gatekeeper ConstraintTemplate. OPA Gatekeeper currently does not support generating Mutating admissions controllers based on ConstraintTemplates but to demonstrate a working example, we will use a simple REST API (Ruby Sinatra app) running in the Kubernetes cluster.

Similar to Validating admissions controllers, Mutating admissions controllers can be configured to be notified when specific events happen in the cluster like a CREATE or UPDATE. Instead of returning a yes or no response to the Kubernetes API, a Mutating admissions controller will return a [JSON patch](http://jsonpatch.com/) object that will tell Kubernetes how to modify the incoming resource.

This example will show how we can modify a submitted pod to add a label after it has been submitted to the cluster. This pattern can be extended to a number of other applications like injecting environment variables, adding side car containers, generating/injecting TLS certificates automatically, and so on. This is a powerful pattern for providing sane defaults to cluster consumers without placing the burden on those users to know how or what to implement for this type of information.

## CHALLENGE

Update the constraint to permit another container registry source, gcr.io
