package io.konveyor.forklift.vmware

default valid_input   = true
default valid_vm      = false
default valid_vm_name = false

valid_input = false {
    is_null(data.io.konveyor.forklift.vmware.vm)
}

valid_vm = true {
    is_string(data.io.konveyor.forklift.vmware.vm.name)
}

valid_vm_name = true {
    regex.match("^[a-z0-9][a-z0-9-]*[a-z0-9]$", data.io.konveyor.forklift.vmware.vm.name)
    count(data.io.konveyor.forklift.vmware.vm.name) <= 64
}

concerns[flag] {
    valid_input
    valid_vm
    not valid_vm_name
    flag := {
        "category": "Critical",
        "label": "Invalid VM Name",
        "assessment": "Kubernetes only supports names that follow DNS subdomain name as defined in RFC 1123. This means that the name can contain lowercase letters (a-z), numbers (0-9), and hyphens (-), up to a maximum of 64 characters. The first and last characters must be alphanumeric. The name must not contain uppercase letters, spaces, periods (.), or special characters."
    }
}
