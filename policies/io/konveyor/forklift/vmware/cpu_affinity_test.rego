package io.konveyor.forklift.vmware

test_without_cpu_affinity {
    input := { "name": "my-vm" }
    results := concerns with input as input
    count(results) == 0
}

test_with_cpu_affinity {
    input := { "name": "my-vm", "config": { "cpuAffinity": "my_affinity" } }
    results := concerns with input as input
    count(results) == 1
}
