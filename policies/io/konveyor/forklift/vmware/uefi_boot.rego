package io.konveyor.forklift.vmware

has_uefi_boot {
    data.io.konveyor.forklift.vmware.vm.firmware == "efi"
}

concerns[flag] {
    has_uefi_boot
    flag := {
        "category": "Critical",
        "label": "UEFI secure boot detected",
        "assessment": "UEFI secure boot is not currently supported by OpenShift Virtualization. The VM cannot be migrated unless UEFI secure boot is disabled."
    }
}