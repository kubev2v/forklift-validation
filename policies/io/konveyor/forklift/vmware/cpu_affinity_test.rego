package io.konveyor.forklift.vmware
 
test_without_cpu_affinity {
    mock_vm := { "name": "test", "cpuAffinity": [] }
    results = concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 0
}

test_with_cpu_affinity {
    mock_vm := { "name": "test", "cpuAffinity": [0,2] }
    results = concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 1
}
