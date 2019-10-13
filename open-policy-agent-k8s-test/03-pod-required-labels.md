# Requiring labels on pods

Our first example will showcase how we can create a validating admissions webhook using Gatekeeper. This example will demonstrate how you can require specific attributes on a Kubernetes object before being allowed to be accepted to the cluster.

Gatekeeper defines two types of Kubernetes custom resources for submitting policy. `ConstraintTemplate`'s are templates of OPA policy and define the parameters needed to consume the template. Once submitted, a `ConstraintTemplate` creates a Kubernetes custom resource based on the included configuration which is called a `Constraint`. A `Constraint` contains the required parameters and what types of Kubernetes events will trigger policy evaluation. Once a `Constraint` is submitted to the cluster, it creates a unique `ValidatingAdmissionWebhook` object based on the configuration.

To get started, first submit the `ConstraintTemplate` that requires an `owner` label on every resource within a specific namespace:

`kubectl apply -f required-labels-template.yaml`{{execute}}

Install the required labels constraint for all objects in the `default` namespace:

`kubectl apply -f required-labels-constraint.yaml`{{execute}}

To demonstrate the policy blocking resources that do not contain a `owner` label, create a pod and show deny:

`kubectl apply -f required-labels-deny.yaml`{{execute}}

Alternatively, create a pod that _does_ specify an `owner` label to pass:

`kubectl apply -f required-labels-allow.yaml`{{execute}}

Delete the deployed pod before proceeding to the challenge:
`kubectl delete pod busybox-valid`{{execute}}

# CHALLENGE

## update the `required-labels-constraint.yaml` to require another label `team`. Then re-submit the new constraint along with a new pod that also specifies the `team` label before continuing.
