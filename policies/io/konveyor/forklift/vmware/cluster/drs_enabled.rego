package io.konveyor.forklift.vmware

has_drs_enabled {
    cluster.drsEnabled
}

concerns[flag] {
    has_drs_enabled
    flag := {
        "category": "info",
        "label": "VMware DRS detected",
        "assessment": "VMware Distributed Resource Scheduler is not supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment."
    }
}
