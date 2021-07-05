package io.konveyor.forklift.ovirt

default valid_bios_string = false
default legal_bios = false

valid_bios_string = true {
    is_string(input.bios)
}

legal_bios = true {
    regex.match(`i440fx_sea_bios|q35_secure_boot|q35_sea_bios`, input.bios)
}

concerns[flag] {
    valid_bios_string
    not legal_bios
    flag := {
        "category": "Critical",
        "label": "BIOS type is not supported by the target cluster",
        "assessment": "The VM's BIOS type does not match ClusterConfig.EmulatedMachines in the target cluster. The VM will not be migrated."
    }
}
