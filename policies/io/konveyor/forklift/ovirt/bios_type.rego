package io.konveyor.forklift.ovirt

default valid_bios = false

valid_bios = true {
    regex.match("i440fx_sea_bios|q35_secure_boot", input.bios)
}

concerns[flag] {
    not valid_bios
    flag := {
        "category": "Critical",
        "label": "BIOS type is not supported by the target cluster",
        "assessment": "The VM's BIOS type does not match ClusterConfig.EmulatedMachines in the target cluster. If migrated the VM will not boot."
    }
}
