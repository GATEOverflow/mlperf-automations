#!/bin/bash
if [[ -z ${MLC_GIT_REPO_CHECKOUT_PATH} ]]; then
    echo "Git repository not found!"
    exit 1
fi
cd ${MLC_GIT_REPO_CHECKOUT_PATH}
scons
test $? -eq 0 || exit $?

