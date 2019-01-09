package kubernetes.admission

import data.kubernetes.namespaces
import data.k8s.validation.allowed as valid_conf

deny[msg] {
    input.request.operation = "CREATE"
    input.request.kind.kind = valid_conf.kinds[i].id

    kind = input.request.kind.kind
    name = input.request.object.metadata.name
    labels = input.request.object.metadata.labels
    validLabels = valid_conf.kinds[i].labels

    an_actual_label = validLabels[j]
    a_valid_label = labels[j]

    not an_actual_label = a_valid_label

    msg = sprintf("invalid labels %q %q for %q with name %q, valid labels are %q", [an_actual_label, a_valid_label, kind, name, validLabels])
}

deny[msg] {
    input.request.operation = "CREATE"
    input.request.kind.kind = valid_conf.kinds[i].id

    kind = input.request.kind.kind
    name = input.request.object.metadata.name

    actualPrefix = input.request.object.spec.template.spec.containers[j].image
    validPrefix = valid_conf.kinds[i].imagePrefix

    not startswith(actualPrefix, validPrefix)

    msg = sprintf("invalid image prefix %q for %q with name %q, valid prefixes are %q", [actualPrefix, kind, name, validPrefix])
}