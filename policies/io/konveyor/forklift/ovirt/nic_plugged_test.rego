package io.konveyor.forklift.ovirt

test_with_plugged_nic {
    mock_vm := {
        "name": "test",
        "nics": [
            { "plugged": true }
          ]
    }
    results := concerns with input as mock_vm
    count(results) == 0
}

test_with_unplugged_nic {
    mock_vm := {
        "name": "test",
        "nics": [
            { "plugged": false }
          ]
    }
    results := concerns with input as mock_vm
    count(results) == 1
}
