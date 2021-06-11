package io.konveyor.forklift.ovirt

test_without_qos {
    mock_vm := {
        "name": "test",
        "nics": [
            { "profile": {
                "qos": "" }
            }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 0
}

test_with_qos {
    mock_vm := {
        "name": "test",
        "nics": [
            { "profile": {
                "qos": "something" }
            }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 1
}