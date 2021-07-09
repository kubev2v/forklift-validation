package io.konveyor.forklift.ovirt

nic_set_to_pci_passthrough [i] {
    some i
    regex.match(`pci_passthrough`, input.nics[i].interface)
}

concerns[flag] {
    count(nic_set_to_pci_passthrough) > 0
    flag := {
        "category": "Critical",
        "label": "NIC with host device passthrough detected",
        "assessment": "The VM is using a vNIC Profile configured for host device passthrough. This is not currently supported by OpenShift Virtualization. The VM will not be migrated."
    }
}

