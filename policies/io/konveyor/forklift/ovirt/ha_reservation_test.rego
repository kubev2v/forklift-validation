package io.konveyor.forklift.ovirt
 
test_without_ha_reservation {
    mock_vm := { "name": "test",
                 "host": {
                    "cluster": {
                        "haReservation": false
                    }
                  }
                }
    results = concerns with input as mock_vm
    count(results) == 0
}

test_with_ha_reservation {
    mock_vm := { "name": "test",
                 "host": {
                    "cluster": {
                        "haReservation": true
                    }
                  }
                }
    results = concerns with input as mock_vm
    count(results) == 1
}