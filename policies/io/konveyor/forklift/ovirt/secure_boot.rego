package io.konveyor.forklift.ovirt

has_secure_boot_enabled {
    input.bios == "q35_secure_boot"
}

concerns[flag] {
    has_secure_boot_enabled
    flag := {
        "category": "Warning",
        "label": "UEFI secure boot detected",
        "assessment": "UEFI secure boot is currently only partially supported by OpenShift Virtualization. Some functionality may be missing after the VM is migrated."
    }
}
