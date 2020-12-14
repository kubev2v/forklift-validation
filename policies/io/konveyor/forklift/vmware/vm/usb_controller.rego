package io.konveyor.forklift.vmware

has_usb_controller {
    vm.usbSupported
}

concerns[flag] {
    has_usb_controller
    flag := {
        "category": "warning",
        "label": "USB controller detected",
        "assessment": "USB controllers are not supported by OpenShift Virtualization. The VM can be migrated but the devices attached to the USB controller will not be migrated."
    }
}