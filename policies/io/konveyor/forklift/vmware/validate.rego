package io.konveyor.forklift.vmware

run_concerns = {
    "rules_version": VERSION,
    "concerns": concerns
}

concerns[message] {
    not valid_vm
    message := {
        "error": "No VM found that matches input parameters"
    }
}

validate = {
    run_concerns
}