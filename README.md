# @mamezou-tech/buildpacks-action

![Run action](https://github.com/mamezou-tech/buildpacks-action/workflows/Run%20action/badge.svg)

Build container image with [Cloud Native Buildpacks](https://buildpacks.io) in GitHub Actions.

```yaml
on: [push]
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2

    - name: Build image
      uses: mamezou-tech/buildpacks-action@master
      with:
        image: 'foo-app'
        tag: '1.0.0'
        path: 'path/to/foo-app/'
        builder: 'gcr.io/paketo-buildpacks/builder:base'
        env: 'HELLO=WORLD FOO=BAR BAZ'

    - name: Push image
```

> buildpacks v0.19.0 will be executed.

## Inputs
- `image` : (required) Name of container image.
- `tag` : (optional) Tag of container image. Default `latest`
- `path` : (optional) Path to target application, defaults to the current directory.
- `builder` : (required) Builder to use.
- `buildpacks` : (optional) URLs or Paths to Custom buildpacks, space separated.
- `env` : (optional) Environment variables, space separated.
- `env_files` : (optional) Files containing build time environment variables, space separated.

> See "[Cloud Native Buildpack Documentation · Environment variables](https://buildpacks.io/docs/app-developer-guide/environment-variables/)" for environment valiables.


Example of building with buildpack

```yaml
on: [push]
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2

    - name: Build image
      uses: mamezou-tech/buildpacks-action@master
      with:
        image: 'sample-java-maven-app'
        path: 'samples/apps/java-maven/'
        builder: 'cnbs/sample-builder:alpine'
        buildpacks: 'samples/buildpacks/java-maven samples/buildpacks/hello-processes/ cnbs/sample-package:hello-universe'
```
