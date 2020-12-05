package io.konveyor.forklift.vmware

concerns[reason] {
    vm.balloonedMemory > 0
    reason := {
        "level": "warning",
        "message": "Memory ballooning is not supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment."
    }
}
