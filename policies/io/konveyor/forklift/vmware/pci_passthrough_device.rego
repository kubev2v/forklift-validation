package io.konveyor.forklift.vmware

has_pci_passthrough_device {
    some i
    input.config.hardware.device[i].class == "VirtualPCIPassthrough"
}

concerns[reason] {
    has_pci_passthrough_device
    reason := {
        "category": "critical",
        "message": "PCI passthrough devices are not supported by OpenShift Virtualization. The VM cannot be migrated unless the passthrough device is removed."
    }
}
