package io.konveyor.forklift.vmware

has_ballooned_memory {
    data.io.konveyor.forklift.vmware.vm.balloonedMemory > 0
}

concerns[flag] {
    has_ballooned_memory
    flag := {
        "category": "Warning",
        "label": "Memory ballooning detected",
        "assessment": "Memory ballooning is not currently supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment."
    }
}
