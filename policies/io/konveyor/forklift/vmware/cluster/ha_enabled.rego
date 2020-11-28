package io.konveyor.forklift.vmware

concerns[reason] {
    cluster.dasEnabled
    reason := {
        "level": "warning",
        "message": "HA is not supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment."
    }
}
