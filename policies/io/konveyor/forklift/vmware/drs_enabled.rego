package io.konveyor.forklift.vmware

has_drs_enabled {
    data.io.konveyor.forklift.vmware.vm.host.cluster.drsEnabled
}

concerns[flag] {
    has_drs_enabled
    flag := {
        "category": "Information",
        "label": "VM running in DRS-enabled cluster",
        "assessment": "Distributed resource scheduling is not currently supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment."
    }
}
