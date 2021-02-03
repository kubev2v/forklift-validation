package io.konveyor.forklift.vmware

run_concerns = {
    "rules_version": RULES_VERSION,
    "errors": status,
    "concerns": concerns
}

status[message] {
    not valid_vm
    message := "No VM found that matches input parameters"
}

validate = {
    run_concerns
}