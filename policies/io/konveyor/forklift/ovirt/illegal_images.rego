package io.konveyor.forklift.ovirt

has_illegal_images {
    input.hasIllegalImages
}

concerns[flag] {
    has_illegal_images
    flag := {
        "category": "Critical",
        "label": "Illegal disk images detected",
        "assessment": "The VM has one or more snapshots with disks in ILLEGAL state. This is not currently supported by OpenShift Virtualization."
    }
}
