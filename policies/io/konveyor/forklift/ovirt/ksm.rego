package io.konveyor.forklift.ovirt

has_ksm_enabled {
    input.host.cluster.ksmEnabled
}

concerns[flag] {
    has_ksm_enabled
    flag := {
        "category": "Warning",
        "label": "Cluster has KSM enabled",
        "assessment": "The host running the source VM has kernel samepage merging enabled for more efficient memory utilization. This feature is not currently supported by OpenShift Virtualization."
    }
}
