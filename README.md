# Release Node Package to GitHub Packages
This action builds node packages and uploads them to [GitHub
Packages](https://github.com/features/packages).

This is based on [this action](https://github.com/jstastny/publish-gem-to-github).

## Usage
Example minimal workflow using this action:
```yaml
on:
  push:
    branches:
      - master
jobs:
  build-package:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: Build and publish npm package
        uses: grnhse/publish-javascript-package-to-github
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
```

## Inputs

| Name | Description |
| -----| ------------|
| `token` | Use `secrets.GITHUB_TOKEN` for this |

## Versioning your package

This action currently does not bump the package's version when building it. It is up to you to do it
(either manually or in a previous workflow step). If you try to release a package with the same
version that already exists, the step will fail.

In case you want to ignore these types of failures, you can add:
```
continue-on-error: true
```
to the build step configuration.
