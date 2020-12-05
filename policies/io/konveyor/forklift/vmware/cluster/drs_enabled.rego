package io.konveyor.forklift.vmware

concerns[reason] {
    cluster.drsEnabled
    reason := {
        "level": "info",
        "message": "VMware Distributed Resource Scheduler is not supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment."
    }
}
