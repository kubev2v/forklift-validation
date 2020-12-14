package io.konveyor.forklift.vmware

has_rdm_disk {
    some i
    vm.disks[i].rdm
}

concerns[flag] {
    has_rdm_disk
    flag := {
        "category": "critical",
        "label": "Raw Device Mapped disk detected",
        "assessment": "RDM disks are not supported by OpenShift Virtualization. The VM cannot be migrated"
    }
}