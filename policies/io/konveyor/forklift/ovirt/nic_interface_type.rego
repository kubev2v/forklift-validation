package io.konveyor.forklift.ovirt

default valid_nic_interface_type = false

valid_nic_interface_type = true {
    some i
    regex.match(`e1000|rtl8139|virtio`, input.nics[i].interface)
}

concerns[flag] {
    not valid_nic_interface_type
    flag := {
        "category": "Critical",
        "label": "Unsupported NIC interface type detected",
        "assessment": "The NIC interface type is not supported by OpenShift Virtualization (only e1000, rtl8139 & virtio interface types are currently supported). The NIC will not function in the migrated VM."
    }
}

