package io.konveyor.forklift.vmware

test_with_no_device {
    mock_vm := {
        "name": "test",
        "devices": []
    }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 0
}

test_with_other_xxx_device {
    mock_vm := {
        "name": "test",
        "devices": [
            { "kind": "VirtualXXXPassthrough" }
        ]
    }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 0
}

test_with_usb_controller {
    mock_vm := {
        "name": "test",
        "devices": [
            { "kind": "VirtualUSBController" }
        ]
    }
    results := concerns with data.io.konveyor.forklift.vmware.vm as mock_vm
    count(results) == 1
}
