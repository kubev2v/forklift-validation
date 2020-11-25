# Konveyor > Forklift > Validation Rules

To test the rules in the repository, you can install Open Policy Agent CLI (see [OPA doc](https://www.openpolicyagent.org/docs/latest/#running-opa)).

Then, you can evaluate the example input:

```
$ opa eval --data policies --input example_inputs/single_vm.json "data.io.konveyor.forklift.vmware"
```

You can also run the unit tests with:

```
$ opa test policies --explain fails
```
