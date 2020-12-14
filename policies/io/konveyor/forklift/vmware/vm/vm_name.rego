package io.konveyor.forklift.vmware

valid_vm_name {
    name := input.name
    regex.match("^[a-z0-9][a-z0-9-]*[a-z0-9]$", name)
    count(name) <= 64
}

concerns[flag] {
    not valid_vm_name
    flag := {
        "category": "critical",
        "label": "Invalid VM Name",
        "assessment": "Kubernetes only supports names that follow DNS subdomain name as defined in RFC 1123. This means that the name must:\n\t- contain no more than 64 characters\n\t- contain only lowercase alphanumeric characters or '-'\n\t- start with an alphanumeric character\n\t- end with an alphanumeric character"
    }
}
