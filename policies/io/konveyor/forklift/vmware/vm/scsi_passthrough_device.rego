package io.konveyor.forklift.vmware

has_scsi_passthrough_device {
    some i
    input.config.hardware.device[i].class == "VirtualSCSIPassthrough"
}

concerns[reason] {
    has_scsi_passthrough_device
    reason := {
        "level": "critical",
        "message": "SCSI passthrough devices are not supported by OpenShift Virtualization. The VM cannot be migrated unless the passthrough device is removed."
    }
}
