package io.konveyor.forklift.vmware

test_without_ballooned_memory {
    mock_vm := { "name": "my-vm", "balloonedMemory": 0 }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 0
}

test_with_balloned_memory {
    mock_vm := { "name": "my-vm", "balloonedMemory": 1024 }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 1
}

