resource "google_compute_network" "default-network" {
    name                    = "${var.prefix}-network"
    auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "default-subnetwork" {
    name                     = "${var.prefix}-subnetwork"
    ip_cidr_range            = "${var.primary_ip_range}"
    region                   = "${var.region}"
    network                  = "${google_compute_network.default-network.self_link}"
}

data "google_container_engine_versions" "zonal-gke-node-versions" {
    project = "${var.project}"
    zone    = "${var.zone}"
}

resource "google_container_cluster" "gke-cluster" {
    name             = "${var.prefix}-gke-cluster"
    zone             = "${var.zone}"
    additional_zones = "${var.additional_zones}"

    network    = "${google_compute_network.default-network.self_link}"
    subnetwork = "${google_compute_subnetwork.default-subnetwork.self_link}"

    min_master_version = "${data.google_container_engine_versions.zonal-gke-node-versions.latest_master_version}"

    initial_node_count = 1

    node_config {
        oauth_scopes = [
            "https://www.googleapis.com/auth/compute",
            "https://www.googleapis.com/auth/devstorage.read_only",
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring",
        ]

        labels {
            prefix = "${var.prefix}"
        }

        tags = [
            "${var.prefix}-gke"]

        machine_type = "${var.machine_type}"
    }

    addons_config {
        http_load_balancing {
            disabled = true
        }

        kubernetes_dashboard {
            disabled = true
        }

        network_policy_config {
            disabled = false
        }
    }

    maintenance_policy {
        daily_maintenance_window {
            start_time = "03:00"
        }
    }

    network_policy {
        enabled  = true
        provider = "CALICO" // CALICO is currently the only supported provider
    }
}
