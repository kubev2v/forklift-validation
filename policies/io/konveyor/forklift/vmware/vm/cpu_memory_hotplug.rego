package io.konveyor.forklift.vmware

default hotplug_enabled = false

hotplug_enabled = true {
    vm.cpuHostAddEnabled == true
}

hotplug_enabled = true {
    vm.cpuHostRemoveEnabled == true
}

hotplug_enabled = true {
    vm.memoryHotAddEnabled == true
}

concerns[flag] {
    hotplug_enabled
    flag := {
        "category": "warning",
        "label": "CPU/memory hotplug",
        "assessment": "Review VM CPU or memory configuration after migration"
    }
}
