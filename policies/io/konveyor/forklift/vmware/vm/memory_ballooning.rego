package io.konveyor.forklift.vmware

has_balooned_memory {
    vm.balloonedMemory > 0
}

concerns[flag] {
    has_balooned_memory
    flag := {
        "category": "warning",
        "label": "Memory ballooning detected",
        "assessment": "Memory ballooning is not supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment."
    }
}
