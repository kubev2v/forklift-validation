package io.konveyor.forklift.ovirt
 
test_without_boot_menu_enabled {
    mock_vm := {  "name": "test",
                  "bios" : {
                      "boot_menu" : {
                          "enabled" : false
                      }
                  }
              }
    results = concerns with input as mock_vm
    count(results) == 0
}

test_with_boot_menu_enabled {
    mock_vm := {  "name": "test",
                  "bios" : {
                      "boot_menu" : {
                          "enabled" : true
                      }
                  }
              }
    results = concerns with input as mock_vm
    count(results) == 1
}