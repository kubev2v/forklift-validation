package io.konveyor.forklift.ovirt

test_without_port_mirroring {
    mock_vm := {
        "name": "test",
        "nics": [
            { "profile": {
                "portMirroring": false }
            }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 0
}

test_with_port_mirroring {
    mock_vm := {
        "name": "test",
        "nics": [
            { "profile": {
                "portMirroring": true }
            },
            { "profile": {
                "portMirroring": false }
            }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 1
}