package io.konveyor.forklift.ovirt

default has_watchdog_enabled = false

has_watchdog_enabled = true {
    count(input.watchDogs) != 0
}

concerns[flag] {
    has_watchdog_enabled
    flag := {
        "category": "Critical",
        "label": "Watchdog detected",
        "assessment": "The VM is configured with a watchdog device, which is not currently supported by OpenShift Virtualization. The VM will not be migrated."
    }
}
