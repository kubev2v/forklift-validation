package io.konveyor.forklift.ovirt

test_with_first_valid_disk_interface_type {
    mock_vm := {
        "name": "test",
        "diskAttachments": [
            { "interface": "sata" }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 0
}

test_with_second_valid_disk_interface_type {
    mock_vm := {
        "name": "test",
        "diskAttachments": [
            { "interface": "virtio_scsi" }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 0
}

test_with_third_valid_disk_interface_type {
    mock_vm := {
        "name": "test",
        "diskAttachments": [
            { "interface": "virtio" }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 0
}

test_with_invalid_disk_interface_type {
    mock_vm := {
        "name": "test",
        "diskAttachments": [
            { "interface": "virtio" },
            { "interface": "ide" },
            { "interface": "virtio" }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 1
}