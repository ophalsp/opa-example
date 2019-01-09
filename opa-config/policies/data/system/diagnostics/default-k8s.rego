package system

import data.kubernetes.admission

main = {
  "apiVersion": "admission.k8s.io/v1beta1",
  "kind": "AdmissionReview",
  "response": response,
}

default response = {"allowed": true}

response = {
    "allowed": false,
    "status": {
        "reason": reason,
    },
} {
    reason = concat(", ", admission.deny)
    reason != ""
}