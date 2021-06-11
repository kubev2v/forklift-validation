package io.konveyor.forklift.ovirt

has_ha_reservation {
    input.host.cluster.haReservation
}

concerns[flag] {
    has_ha_reservation
    flag := {
        "category": "Warning",
        "label": "Cluster has HA reservation",
        "assessment": "The cluster running the source VM has a resource reservation to allow highly available VMs to be started. This feature is not currently supported by OpenShift Virtualization."
    }
}
