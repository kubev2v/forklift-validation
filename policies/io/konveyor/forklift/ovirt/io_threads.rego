package io.konveyor.forklift.ovirt

has_iothreads_enabled {
    input.ioThreads > 1
}

concerns[flag] {
    has_iothreads_enabled
    flag := {
        "category": "Information",
        "label": "IO Threads configuration detected",
        "assessment": "The VM is configured to use I/O threads. This configuration will not be automatically applied to the migrated VM, and must be manually re-applied if required."
    }
}
