#!/bin/sh -l

set -e

echo "pack build ${INPUT_IMAGE}:${INPUT_TAG} --path ${INPUT_PATH} --builder ${INPUT_BUILDER}"

sh -c "pack $*"
