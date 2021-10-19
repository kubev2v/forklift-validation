package io.konveyor.forklift.ovirt
 
test_without_host_usb_device {
    mock_vm := { "name": "test", "hostDevices": [] }
    results = concerns with input as mock_vm
    count(results) == 0
}

test_with_host_usb_device {
    mock_vm := { "name": "test",
                 "hostDevices": [
                    {
                        "capability": "usb_device",
                        "product": "2.0 root hub",
                        "vendor": "Linux Foundation"
                    }
                  ],
                }
    results = concerns with input as mock_vm
    # count should be 2 as this test also invalidates the host_devices rule
    count(results) == 2
}
