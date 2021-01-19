package io.konveyor.forklift.vmware

default has_hotplug_enabled = false

has_hotplug_enabled = true {
    vm.cpuHotAddEnabled == true
}

has_hotplug_enabled = true {
    vm.cpuHotRemoveEnabled == true
}

has_hotplug_enabled = true {
    vm.memoryHotAddEnabled == true
}

concerns[flag] {
    has_hotplug_enabled
    flag := {
        "category": "warning",
        "label": "CPU/memory hotplug",
        "assessment": "Review VM CPU or memory configuration after migration"
    }
}
