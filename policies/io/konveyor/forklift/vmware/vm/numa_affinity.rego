package io.konveyor.forklift.vmware

has_numa_node_affinity {
    count(vm.numaNodeAffinity) != 0
}

concerns[flag] {
    has_numa_node_affinity
    flag := {
        "category": "warning",
        "label": "NUMA node affinity detected",
        "assessment": "NUMA node affinity is not supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment."
    }
}
