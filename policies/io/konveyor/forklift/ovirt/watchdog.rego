package io.konveyor.forklift.ovirt

has_watchdog_enabled {
    count(input.watchDogs) != 0
}

concerns[flag] {
    has_watchdog_enabled
    flag := {
        "category": "Critical",
        "label": "Watchdog detected",
        "assessment": "The VM is configured with a watchdog device. These devices not currently supported by OpenShift Virtualization."
    }
}
