package io.konveyor.forklift.vmware

test_without_pci_passthrough_device {
  input := {
    "name": "my-vm",
    "config": {
      "hardware": {
        "device": [
          { "key": "disk-200", "path": "/x/y/hard_disk1.vmdk", "class": "VirtualIDEDisk" },
        ]
      }
    }
  }
  results := concerns with input as input
  count(results) == 0
}

test_with_pci_passthrough_device {
  input := {
    "name": "my-vm",
    "config": {
      "hardware": {
        "device": [
          { "key": "disk-200", "path": "/x/y/hard_disk1.vmdk", "class": "VirtualIDEDisk" },
          { "key": "gpu-200", "class": "VirtualPCIPassthrough" }
        ]
      }
    }
  }
  results := concerns with input as input
  count(results) == 1
}
