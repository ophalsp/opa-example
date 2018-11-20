package validation

allowed = {
    "kind": "Deployment",
    "apiVersion": "apps/v1beta1/Deployment",
    "spec": {
        "containers": [
            {
                "image-prefix": "eu.gcr.io"
            }
        ],
        "metadata": {
            "labels": [
                { "type" : "application"}
            ]
        }
    }
}