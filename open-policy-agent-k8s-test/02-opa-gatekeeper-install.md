# Install Open Policy Agent Gatekeeper

Open Policy Agent (OPA) is a general-purpose policy engine with uses ranging from authorization and admission control to data filtering. OPA provides greater flexibility and expressiveness than hard-coded service logic or ad-hoc domain-specific languages. And it comes with powerful tooling to help you get started.

OPA Gatekeeper extends Open Policy Agent to allow users to define OPA policies as native Kubernetes resources. Gatekeeper simplifies the lifecycle of creating and maintaining OPA policies within your Kubernetes cluster and additionally provides the following benefits over standard OPA within a Kubernetes cluster:

* An extensible, parameterized policy library
* Native Kubernetes CRDs for instantiating the policy library (aka "constraints")
* Native Kubernetes CRDs for extending the policy library (aka "constraint templates")
* Audit functionality

To get started, install OPA Gatekeeper and continue:

1. Install Gatekeeper:
   `kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml`{{execute}}
