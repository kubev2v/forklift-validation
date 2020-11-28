package io.konveyor.forklift.vmware

concerns[reason] {
    vm.faultToleranceEnabled
    reason := {
        "level": "warning",
        "message": "Fault tolerance is not supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment."
    }
}
