package io.konveyor.forklift.ovirt

host_usb_device [i] {
    some i
    regex.match(`usb_device`, input.hostDevices[i].capability)
}

concerns[flag] {
    count(host_usb_device) > 0
    flag := {
        "category": "Critical",
        "label": "Host USB device",
        "assessment": "A host USB device has been attached to this VM, which is not currently supported by OpenShift Virtualization. The VM will not be migrated."
    }
}
