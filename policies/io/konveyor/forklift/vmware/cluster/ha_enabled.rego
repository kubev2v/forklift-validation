package io.konveyor.forklift.vmware

has_ha_enabled {
    cluster.dasEnabled
}

concerns[flag] {
    has_ha_enabled
    flag := {
        "category": "warning",
        "label": "VM running on HA host",
        "assessment": "HA is not supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment."
    }
}
