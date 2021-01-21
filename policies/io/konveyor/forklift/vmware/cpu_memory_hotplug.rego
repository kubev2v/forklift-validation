package io.konveyor.forklift.vmware

default has_hotplug_enabled = false

has_hotplug_enabled = true {
    data.io.konveyor.forklift.vmware.vm.cpuHotAddEnabled == true
}

has_hotplug_enabled = true {
    data.io.konveyor.forklift.vmware.vm.cpuHotRemoveEnabled == true
}

has_hotplug_enabled = true {
    data.io.konveyor.forklift.vmware.vm.memoryHotAddEnabled == true
}

concerns[flag] {
    has_hotplug_enabled
    flag := {
        "category": "Warning",
        "label": "CPU/Memory hotplug detected",
        "assessment": "Hot pluggable CPU or memory is not currently supported by OpenShift Virtualization. Review CPU or memory configuration after migration."
    }
}
