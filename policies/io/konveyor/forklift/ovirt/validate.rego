package io.konveyor.forklift.ovirt

validate = {
    "rules_version": RULES_VERSION,
    "errors": errors,
    "concerns": concerns
}

errors[message] {
    not valid_vm
    message := "No VM found that matches input parameters"
}
