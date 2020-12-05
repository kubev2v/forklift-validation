package io.konveyor.forklift.vmware

has_not_hotplug {
    not vm.cpuHotAddEnabled
    not vm.cpuHotRemoveEnabled
    not vm.memoryHotAddEnabled
}

concerns[reason] {
    not is_null(vm)
    not has_not_hotplug
    reason := {
        "level": "info",
        "message": "Hotplug CPU or memory is enabled for the VM. Review VM configuration after migration."
    }
}
