# Konveyor > Forklift > Validation Rules

To test the rules in the repository, you can install Open Policy Agent CLI (see [OPA doc](https://www.openpolicyagent.org/docs/latest/#running-opa)).

Then you can run the unit tests with:

```
$ opa test policies --explain fails
```

Whenever the rules are edited or updated, the relevant policies/io/konveyor/forklift/<provider>/rules_version.rego file should be updated with an incremented number.

