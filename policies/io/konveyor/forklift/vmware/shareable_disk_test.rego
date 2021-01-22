package io.konveyor.forklift.vmware

test_with_no_disks {
    mock_vm := {
        "name": "test",
        "disks": []
    }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 0
}

test_with_no_shareable_disk {
    mock_vm := {
        "name": "test",
        "disks": [
            { "shared": false }
        ]
    }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 0
}

test_with_shareable_disk {
    mock_vm := {
        "name": "test",
        "disks": [
            { "shared": true }
        ]
    }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 1
}