package io.konveyor.forklift.ovirt

valid_nic_interfaces [i] {
    some i
    regex.match(`e1000|rtl8139|virtio`, input.nics[i].interface)
}

number_of_nics [i] {
    some i
    input.nics[i].id
}

concerns[flag] {
    count(valid_nic_interfaces) != count(number_of_nics)
    flag := {
        "category": "Critical",
        "label": "Unsupported NIC interface type detected",
        "assessment": "The NIC interface type is not supported by OpenShift Virtualization (only e1000, rtl8139 and virtio interface types are currently supported). The VM will not be migrated."
    }
}

