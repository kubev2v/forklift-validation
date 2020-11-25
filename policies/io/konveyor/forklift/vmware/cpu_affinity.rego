package io.konveyor.forklift.vmware

has_cpu_affinity {
    cpu_affinity := input.config.cpuAffinity
    count(cpu_affinity) != 0
}

concerns[{"level": lvl, "message": msg}] {
    has_cpu_affinity
    lvl := "warning"
    msg := "CPU affinity is not supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment."
}
