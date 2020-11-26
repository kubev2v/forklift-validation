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

# Running OPA as a REST API

The Dockerfile allows you to create a container image.

```
$ podman build -t quay.io/example.com/opa:latest .
```

Then, this image can be used to start the OPA REST server.

```
$ podman run --detach --rm --publish 8181 quay.io/example.com/opa:latest
```

The image is very basic right now, so it will listen on port 8181.
You can ask for a decision using the example input file:

```
$ curl localhost:8181/v1/data/io/konveyor/forklift/vmware \
    -d @example_inputs/api_single_vm.json \
    -H 'Content-Type: application/json'
```

