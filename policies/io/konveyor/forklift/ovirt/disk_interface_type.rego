package io.konveyor.forklift.ovirt

default valid_disk_interface_type = false

valid_disk_interface_type = true {
    some i
    regex.match("sata|virtio_scsi|virtio", input.diskAttachments[i].interface)
}

concerns[flag] {
    not valid_disk_interface_type
    flag := {
        "category": "Critical",
        "label": "Unsupported disk interface type detected",
        "assessment": "The disk interface type is not supported by OpenShift Virtualization (only sata, virtio_scsi & virtio interface types are currently supported). The disk will not function in the migrated VM."
    }
}
