package io.konveyor.forklift.vmware

test_without_cpu_affinity {
    mock_vm := { "name": "my-vm", "cpuAffinity": [] }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 0
}

test_with_cpu_affinity {
    mock_vm := { "name": "my-vm", "cpuAffinity": ["my_affinity"] }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 1
}
