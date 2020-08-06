#!/bin/sh -l

GITHUB_TOKEN=$1

[ -z "${GITHUB_TOKEN}" ] && { echo "Missing input.token!"; exit 2; }

echo "Setting up access to GitHub Package Registry"
touch ~/.npmrc
echo "//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}" >> ~/.npmrc

npm publish
