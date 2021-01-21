package io.konveyor.forklift.vmware

default valid_input   = true
default valid_vm_name = false

valid_input = false {
  is_null(data.io.konveyor.forklift.vmware.vm)
}

valid_vm_name = true {
    regex.match("^[a-z0-9][a-z0-9-]*[a-z0-9]$", data.io.konveyor.forklift.vmware.vm.name)
    count(data.io.konveyor.forklift.vmware.vm.name) <= 64
}

concerns[flag] {
    valid_input
    not valid_vm_name
    flag := {
        "category": "Critical",
        "label": "Invalid VM Name",
        "assessment": "Kubernetes only supports names that follow DNS subdomain name as defined in RFC 1123. This means that the name must:\n\t- contain no more than 64 characters\n\t- contain only lowercase alphanumeric characters or '-'\n\t- start with an alphanumeric character\n\t- end with an alphanumeric character"
    }
}
