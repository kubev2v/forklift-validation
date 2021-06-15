package io.konveyor.forklift.ovirt

test_with_one_plugged_nic {
    mock_vm := {
        "name": "test",
        "nics": [
            { "plugged": true }
          ]
    }
    results := concerns with input as mock_vm
    count(results) == 0
}

test_with_two_plugged_nics {
    mock_vm := {
        "name": "test",
        "nics": [
            { "plugged": true },
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
            { "plugged": true },
            { "plugged": false }
          ]
    }
    results := concerns with input as mock_vm
    count(results) == 1
}
