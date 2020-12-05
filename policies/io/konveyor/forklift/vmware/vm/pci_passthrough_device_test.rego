package io.konveyor.forklift.vmware

test_without_pci_passthrough_device {
    mock_vm := {
        "name": "my-vm",
        "devices": [
            { "key": "disk-200", "path": "/x/y/hard_disk1.vmdk", "class": "VirtualIDEDisk" },
        ]
    }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 0
}

test_with_pci_passthrough_device {
    mock_vm := {
        "name": "my-vm",
        "devices": [
            { "key": "disk-200", "path": "/x/y/hard_disk1.vmdk", "class": "VirtualIDEDisk" },
            { "key": "gpu-200", "class": "VirtualPCIPassthrough" }
        ]
    }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 1
}
