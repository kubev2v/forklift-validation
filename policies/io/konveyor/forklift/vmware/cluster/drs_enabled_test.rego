package io.konveyor.forklift.vmware

test_with_drs_disabled {
    mock_cluster := { "name": "my-cluster", "drsEnabled": false }
    results := concerns with data.io.konveyor.forklift.vmware.cluster as mock_cluster
    count(results) == 0
}

test_with_drs_enabled {
    mock_cluster := { "name": "my-cluster", "drsEnabled": true }
    results := concerns with data.io.konveyor.forklift.vmware.cluster as mock_cluster
    count(results) == 1
}

