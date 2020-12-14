package io.konveyor.forklift.vmware

has_sriov_device {
    vm.sriovSupported
}

concerns[flag] {
    has_sriov_device
    flag := {
        "category": "critical",
        "label": "SR-IOV passthrough adapter configuration detected",
        "assessment": "SR-IOV passthrough adapter configuration is not supported by OpenShift Virtualization"
    }
}