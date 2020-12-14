package io.konveyor.forklift.vmware

has_cpu_affinity {
    count(input.cpuAffinity) != 0
}

concerns[flag] {
    has_cpu_affinity
    flag := {
        "category": "warning",
        "label": "CPU affinity detected",
        "assessment": "CPU affinity is not supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment."
    }
}
