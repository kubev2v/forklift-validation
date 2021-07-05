package io.konveyor.forklift.ovirt

test_with_first_valid_bios {
    mock_vm := {
        "name": "test",
        "bios": {
            "type": "i440fx_sea_bios"
        }
    }
    results := concerns with input as mock_vm
    count(results) == 0
}

test_with_second_valid_bios {
    mock_vm := {
        "name": "test",
        "bios": {
            "type": "q35_secure_boot"
        }
    }
    results := concerns with input as mock_vm
    # There should only be one result returned, from the 'secure_boot' rule.
    count(results) == 1
}

test_with_invalid_bios {
    mock_vm := {
        "name": "test",
        "bios": {
            "type": "Gigabyte Technology Co., Ltd."
        }
    }
    results := concerns with input as mock_vm
    count(results) == 1
}
