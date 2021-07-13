package io.konveyor.forklift.ovirt

default valid_placement_policy_affinity_string = false
default legal_placement_policy_affinity = false

valid_placement_policy_affinity_string = true {
    is_string(input.placementPolicyAffinity)
}

legal_placement_policy_affinity = true {
    regex.match(`user_migratable|pinned`, input.placementPolicyAffinity)
}

concerns[flag] {
    valid_placement_policy_affinity_string
    not legal_placement_policy_affinity
    flag := {
        "category": "Critical",
        "label": "Placement policy affinity",
        "assessment": "The VM has a placement policy affinity setting that is incompatible with OpenShift Virtualization. The VM will not be migrated."
    }
}
