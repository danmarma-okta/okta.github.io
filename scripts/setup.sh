#!/bin/bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Where the generated Jekyll site will be placed
GENERATED_SITE_LOCATION="dist"

# Define these ENV vars if they aren't defined already,
# so these scripts can be run outside of CI
if [[ -z "${BUILD_FAILURE}" ]]; then
    export BUILD_FAILURE=1
fi

if [[ -z "${SUCCESS}" ]]; then
    export SUCCESS=0
fi

# Use newer, faster npm
npm install -g npm@5.0.3

# Install required dependencies
npm install -g @okta/ci-update-package
npm install -g @okta/ci-pkginfo
npm install -g n

# Use latest version of Node
n 0.9.4
