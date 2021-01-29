# Konveyor > Forklift > Validation Rules

When running as the `forklift-validation` pod in OpenShift, the rules can be called by making an https POST call to `<pod>/v1/data/io/konveyor/forklift/vmware/concerns`

The call must provide a JSON payload containing the VMware provider namespace and name, and VM Managed Object Reference, in the following format:

```
{
   "input": {
      "provider": {
        "namespace": "openshift-migration",
        "name": "test"
      },
      "vm_moref": "vm-431"
    }
}
```

The return is a JSON structure containing the concerns relevant to that VM, for example:

```
{
    "result": [
        {
            "assessment": "USB controllers are not currently supported by OpenShift Virtualization. The VM can be migrated but the devices attached to the USB controller will not be migrated.",
            "category": "Warning",
            "label": "USB controller detected"
        },
        {
            "assessment": "Host/Node HA is not currently supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment.",
            "category": "Warning",
            "label": "VM running in HA-enabled cluster"
        },
        {
            "assessment": "NUMA node affinity is not currently supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment.",
            "category": "Warning",
            "label": "NUMA node affinity detected"
        },
        {
            "assessment": "Hot pluggable CPU or memory is not currently supported by OpenShift Virtualization. Review CPU or memory configuration after migration.",
            "category": "Warning",
            "label": "CPU/Memory hotplug detected"
        },
        {
            "assessment": "CPU affinity is not supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment.",
            "category": "Warning",
            "label": "CPU affinity detected"
        },
        {
            "assessment": "Distributed resource scheduling is not currently supported by OpenShift Virtualization. The VM can be migrated but it will not have this feature in the target environment.",
            "category": "Information",
            "label": "VM running in a DRS-enabled cluster"
        }
    ]
}
```

The rules in the repository can be tested from the command lineusing the Open Policy Agent CLI (see [OPA doc](https://www.openpolicyagent.org/docs/latest/#running-opa)).

Then you can run the unit tests with:

```
$ opa test policies --explain fails
```

Whenever the rules are edited or updated, the relevant `policies/io/konveyor/forklift/<provider>/rules_version.rego` file **must** be updated with an incremented number, for example:

```
rules_version[version] {
  version := {
    "version": 3
  }
}
```

