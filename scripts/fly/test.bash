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

pushd $REPO_PATH > /dev/null
bosh sync-blobs
popd > /dev/null

echo "Testing ${1}"

ROOTFS_ENVS='WINC_TEST_ROOTFS=docker:///cloudfoundry/windows2016fs:2019'
ENVS="$ROOTFS_ENVS

${ENVS:-}" \
FLY_OS=windows \
FUNCTIONS='ci/winc-release/helpers/configure-binaries.ps1' \
DIR="src/code.cloudfoundry.org/${1}" \
"$CI/bin/fly-exec.bash" run-bin-test -i repo="${REPO_PATH}" -i built-binaries="${BUILT_BINARIES}" -p
