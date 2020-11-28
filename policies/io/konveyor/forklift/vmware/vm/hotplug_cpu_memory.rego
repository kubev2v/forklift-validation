package io.konveyor.forklift.vmware

has_not_hotplug {
    is_null(vm.cpu_hot_add_enabled)
    is_null(vm.cpu_hot_removed_enabled)
    is_null(vm.memory_hot_add_enabed)
}

concerns[reason] {
    not has_not_hotplug
    reason := {
        "level": "info",
        "message": "Review VM CPU or memory configuration after migration."
    }
}
