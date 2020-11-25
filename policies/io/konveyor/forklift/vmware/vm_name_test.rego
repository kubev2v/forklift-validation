package io.konveyor.forklift.vmware

test_valid_vm_name {
  input := { "name": "my-vm" }
  results := concerns with input as input
  count(results) == 0
}

test_vm_name_too_long {
  input := { "name": "my-vm-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" }
  results := concerns with input as input
  count(results) == 1
}

test_vm_name_invalid_char {
  input := { "name": "my_vm" }
  results := concerns with input as input
  count(results) == 1
}
