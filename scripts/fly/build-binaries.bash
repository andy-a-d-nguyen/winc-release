#!/bin/bash

set -eu
set -o pipefail

THIS_FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
WORKSPACE_DIR="${THIS_FILE_DIR}/../../.."
BUILT_BINARIES="$WORKSPACE_DIR/built-binaries/winc-release"
CI="${WORKSPACE_DIR}/wg-app-platform-runtime-ci"
. "$CI/shared/helpers/git-helpers.bash"
REPO_NAME=$(git_get_remote_name)
REPO_PATH="${THIS_FILE_DIR}/../../"
unset THIS_FILE_DIR

if [[ "${WITH_CLEAN:-no}" == "yes" ]]; then
  rm -rf "${BUILT_BINARIES}"
fi

if [[ ! -d "${BUILT_BINARIES}" ]]; then
  FLY_OS=windows FUNCTIONS="ci/winc-release/helpers/build-binaries.ps1" MAPPING='Build-Groot=src/code.cloudfoundry.org/groot-windows
  Build-Winc-Network=src/code.cloudfoundry.org/winc/cmd/winc-network
  Build-Winc=src/code.cloudfoundry.org/winc/cmd/winc' \
    "$CI/bin/fly-exec.bash" build-binaries -i repo="${REPO_PATH}" -o built-binaries="${BUILT_BINARIES}"
fi
