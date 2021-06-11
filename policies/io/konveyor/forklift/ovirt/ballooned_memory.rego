package io.konveyor.forklift.ovirt

has_ballooned_memory {
    input.balloonedMemory
}

concerns[flag] {
    has_ballooned_memory
    flag := {
        "category": "Information",
        "label": "VM has memory ballooning enabled",
        "assessment": "The VM has memory ballooning enabled. This is not currently supported by OpenShift Virtualization."
    }
}
