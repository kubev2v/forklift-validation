package io.konveyor.forklift.ovirt

has_shared_disk {
    some i
    input.diskAttachments[i].disk.shared
}

concerns[flag] {
    has_shared_disk
    flag := {
        "category": "Warning",
        "label": "Shared disk detected",
        "assessment": "The VM has a disk that is shared. Shared disks are not currently supported by OpenShift Virtualization."
    }
}
