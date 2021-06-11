package io.konveyor.forklift.ovirt

default unplugged_nic = false

unplugged_nic = true {
    some i
    input.nics[i].plugged == false
}

concerns[flag] {
    unplugged_nic
    flag := {
        "category": "Warning",
        "label": "Unplugged NIC detected",
        "assessment": "The VM has a NIC that is unplugged from a network. This is not currently supported by OpenShift Virtualization."
    }
}
