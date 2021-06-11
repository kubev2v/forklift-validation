package io.konveyor.forklift.ovirt

default has_nic_with_qos_enabled = false

has_nic_with_qos_enabled = true {
    some i
    input.nics[i].profile.qos != ""
}

concerns[flag] {
    has_nic_with_qos_enabled
    flag := {
        "category": "Warning",
        "label": "NIC with QoS settings detected",
        "assessment": "The VM has a vNIC Profile that includes Quality of Service settings. This is not currently supported by OpenShift Virtualization."
    }
}
