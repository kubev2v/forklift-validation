package io.konveyor.forklift.ovirt

has_host_devices {
    count(input.hostDevices) != 0
}

concerns[flag] {
    has_host_devices
    flag := {
        "category": "Information",
        "label": "VM has mapped host devices",
        "assessment": "The VM is configured with hardware devices mapped from the host. This functionality is not currently supported by OpenShift Virtualization."
    }
}
