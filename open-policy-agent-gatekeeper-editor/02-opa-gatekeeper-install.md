Open Policy Agent (OPA) is a general-purpose policy engine with uses ranging from authorization and admission control to data filtering. OPA provides greater flexibility and expressiveness than hard-coded service logic or ad-hoc domain-specific languages. And it comes with powerful tooling to help you get started.

OPA Gatekeeper extends Open Policy Agent to allow users to define OPA policies as native Kubernetes resources. Gatekeeper simplifies the lifecycle of creating and maintaining OPA policies within your Kubernetes cluster and additionally provides the following benefits over standard OPA within a Kubernetes cluster:

* An extensible, parameterized policy library
* Native Kubernetes CRDs for instantiating the policy library (aka "constraints")
* Native Kubernetes CRDs for extending the policy library (aka "constraint templates")
* Audit functionality

To get started, install OPA Gatekeeper and continue:

1. Install a recent release of Gatekeeper:
   `kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/70f65c411552170b4e155c550bc1755c412b27eb/deploy/gatekeeper.yaml`{{execute}}
   This will install several resources into the Kubernetes cluster, notably the `gatekeeper-controller-manager` StatefulSet into its own `gatekeeper-system` Namespace.
1. Wait for the Gatekeeper controller to startup:
   `kubectl wait -n gatekeeper-system pod --all --for=condition=Ready --timeout=3m`{{execute}}
