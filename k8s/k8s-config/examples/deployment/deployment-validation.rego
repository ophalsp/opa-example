package kubernetes.admission

import data.kubernetes.deployments

deny[msg] {
    input.request.kind.kind = "Deployment"
    input.request.operation = "CREATE"
    name = input.request.object.spec.name
    name = "test"
    msg = sprintf("invalid deployment name %q", [name])
}
