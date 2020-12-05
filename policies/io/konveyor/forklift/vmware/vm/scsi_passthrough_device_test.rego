package io.konveyor.forklift.vmware

test_without_scsi_passthrough_device {
    mock_vm := {
        "name": "my-vm",
        "devices": [
            { "key": "disk-200", "path": "/x/y/hard_disk1.vmdk", "class": "VirtualIDEDisk" },
            { "key": "disk-201", "path": "/x/y/hard_disk2.vmdk", "class": "VirtualIDEDisk" }
        ]
    }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 0
}

test_with_scsi_passthrough_device {
    mock_vm := {
        "name": "my-vm",
        "devices": [
            { "key": "disk-200", "path": "/x/y/hard_disk1.vmdk", "class": "VirtualIDEDisk" },
            { "key": "disk-201", "path": "/x/y/hard_disk2.vmdk", "class": "VirtualSCSIPassthrough" }
        ]
    }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 1
}
