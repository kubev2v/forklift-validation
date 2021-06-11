package io.konveyor.forklift.ovirt

default has_nic_port_mirroring_enabled = false

has_nic_port_mirroring_enabled = true {
    some i
    input.nics[i].profile.portMirroring == true
}

concerns[flag] {
    has_nic_port_mirroring_enabled
    flag := {
        "category": "Warning",
        "label": "NIC with port mirroring detected",
        "assessment": "The VM is using a vNIC Profile configured with port mirroring. This is not currently supported by OpenShift Virtualization."
    }
}
