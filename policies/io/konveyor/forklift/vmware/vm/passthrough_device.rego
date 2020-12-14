package io.konveyor.forklift.vmware

has_passthrough_device {
    vm.passthroughSupported
}

concerns[flag] {
    has_passthrough_device
    flag := {
        "category": "critical",
        "label": "Passthrough device detected",
        "assessment": "SCSI or PCI passthrough devices are not supported by OpenShift Virtualization. The VM cannot be migrated unless the passthrough device is removed."
    }
}
