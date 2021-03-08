package io.konveyor.forklift.vmware

has_snapshot {
    data.io.konveyor.forklift.vmware.vm.snapshot.kind == "VirtualMachineSnapshot"
}

concerns[flag] {
    has_snapshot
    flag := {
        "category": "Information",
        "label": "VM snapshot detected",
        "assessment": "Warm migration may not be possible for this VM"
    }
}