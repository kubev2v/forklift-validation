package io.konveyor.forklift.ovirt

valid_disk_interfaces [i] {
    some i
    regex.match(`sata|virtio_scsi|virtio`, input.diskAttachments[i].interface)
}

number_of_disks [i] {
    some i
    input.diskAttachments[i].interface
}

concerns[flag] {
    count(valid_disk_interfaces) != count(number_of_disks)
    flag := {
        "category": "Critical",
        "label": "Unsupported disk interface type detected",
        "assessment": "The disk interface type is not supported by OpenShift Virtualization (only sata, virtio_scsi & virtio interface types are currently supported). The disk will not function in the migrated VM."
    }
}
