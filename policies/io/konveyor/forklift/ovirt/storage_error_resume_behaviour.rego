package io.konveyor.forklift.ovirt

storage_error_resume_behaviour {
    input.storageErrorResumeBehaviour != "auto_resume"
}

concerns[flag] {
    storage_error_resume_behaviour
    flag := {
        "category": "Information",
        "label": "VM storage_error_resume_behaviour",
        "assessment": sprintf("The VM has storage error resume behaviour set to <%v>", [input.storageErrorResumeBehaviour])
    }
}
