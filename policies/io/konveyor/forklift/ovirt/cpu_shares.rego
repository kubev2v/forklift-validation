package io.konveyor.forklift.ovirt

has_cpushares_enabled {
    input.cpuShares > 0
}

concerns[flag] {
    has_cpushares_enabled
    flag := {
        "category": "Information",
        "label": "VM has CPU Shares Defined",
        "assessment": "The VM has CPU shares defined. This functionality is not currently supported by OpenShift Virtualization."
    }
}
