package io.konveyor.forklift.vmware

test_valid_vm_name {
    mock_vm := { "name": "test" }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 0
}

test_vm_name_too_long {
    mock_vm := { "name": "my-vm-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 1
}

test_vm_name_invalid_char {
    mock_vm := { "name": "my_vm" }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 1
}
