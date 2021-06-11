package io.konveyor.forklift.ovirt

test_with_first_valid_nic_interface_type {
    mock_vm := {
        "name": "test",
        "nics": [
            { "interface": "e1000" }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 0
}

test_with_second_valid_nic_interface_type {
    mock_vm := {
        "name": "test",
        "nics": [
            { "interface": "rtl8139" }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 0
}

test_with_third_valid_nic_interface_type {
    mock_vm := {
        "name": "test",
        "nics": [
            { "interface": "virtio" }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 0
}

test_with_invalid_nic_interface_type {
    mock_vm := {
        "name": "test",
        "nics": [
            { "interface": "broadcom" }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 1
}