package io.konveyor.forklift.vmware

test_with_ha_disabled {
    mock_cluster := { "name": "my-cluster", "dasEnabled": false }
    results := concerns with data.io.konveyor.forklift.vmware.cluster as mock_cluster
    count(results) == 0
}

test_with_ha_enabled {
    mock_cluster := { "name": "my-cluster", "dasEnabled": true }
    results := concerns with data.io.konveyor.forklift.vmware.cluster as mock_cluster
    count(results) == 1
}

