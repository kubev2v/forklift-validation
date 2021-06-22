package io.konveyor.forklift.ovirt

test_without_network_filter {
    mock_vm := {
        "name": "test",
        "nics": [
            { "profile": {
                "networkFilter": "" }
            }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 0
}

test_with_network_filter {
    mock_vm := {
        "name": "test",
        "nics": [
            { "profile": {
                "networkFilter": "" }
            },
            { "profile": {
                "networkFilter": "343f43d2-23eb-11e8-a056-00163e18b6f7" }
            }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 1
}