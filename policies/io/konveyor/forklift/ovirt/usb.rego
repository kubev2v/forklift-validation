package io.konveyor.forklift.ovirt

default has_usb_enabled = false

has_usb_enabled = value {
   value :=  input.usbEnabled
}

concerns[flag] {
    has_usb_enabled
    flag := {
        "category": "Critical",
        "label": "USB support enabled",
        "assessment": "The VM has USB support enabled, but USB devices are not currently supported by OpenShift Virtualization. The VM will not be migrated."
    }
}
