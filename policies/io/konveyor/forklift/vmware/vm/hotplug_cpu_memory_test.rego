package io.konveyor.forklift.vmware

test_with_hotplug_disabled {
    mock_vm := {
        "name": "my-vm",
        "cpuHotAddEnabled": false,
        "cpuHotRemoveEnabled": false,
        "memoryHotAddEnabled": false
    }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 0
}

test_with_cpu_hot_add_enabled {
    mock_vm := {
        "name": "my-vm",
        "cpuHotAddEnabled": true,
        "cpuHotRemoveEnabled": false,
        "memoryHotAddEnabled": false
    }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 1
}

test_with_cpu_hot_remove_enabled {
    mock_vm := {
        "name": "my-vm",
        "cpuHotAddEnabled": false,
        "cpuHotRemoveEnabled": true,
        "memoryHotAddEnabled": false
    }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 1
}

test_with_memory_hot_add_enabled {
    mock_vm := {
        "name": "my-vm",
        "cpuHotAddEnabled": false,
        "cpuHotRemoveEnabled": false,
        "memoryHotAddEnabled": true
    }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 1
}
