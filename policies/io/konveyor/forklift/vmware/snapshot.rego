package io.konveyor.forklift.vmware

has_snapshot {
    data.io.konveyor.forklift.vmware.vm.snapshot.kind == "VirtualMachineSnapshot"
}

concerns[flag] {
    has_snapshot
    flag := {
        "category": "Information",
        "label": "VM snapshot detected",
        "assessment": "Online snapshots are not currently supported by OpenShift Virtualization."
    }
}