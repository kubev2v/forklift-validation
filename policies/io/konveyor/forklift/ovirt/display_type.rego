package io.konveyor.forklift.ovirt

has_spice_display_enabled {
    input.display == "spice"
}

concerns[flag] {
    has_spice_display_enabled
    flag := {
        "category": "Information",
        "label": "VM Display Type",
        "assessment": "The VM is using the SPICE protocol for video display. This is not supported by OpenShift Virtualization."
    }
}
