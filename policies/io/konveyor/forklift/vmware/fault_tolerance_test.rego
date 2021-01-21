package io.konveyor.forklift.vmware

test_with_fault_tolerance_disabled {
    mock_vm := { "name": "test", "faultToleranceEnabled": false }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 0
}

test_with_fault_tolerance_enabled {
    mock_vm := { "name": "test", "faultToleranceEnabled": true }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 1
}
