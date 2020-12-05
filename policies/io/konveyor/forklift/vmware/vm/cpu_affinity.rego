package io.konveyor.forklift.vmware

has_cpu_affinity {
    cpu_affinity := vm.cpuAffinity
    count(cpu_affinity) != 0
}

concerns[reason] {
    has_cpu_affinity
    reason := {
        "level": "warning",
        "message": "CPU affinity is not supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment."
    }
}
