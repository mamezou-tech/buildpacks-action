#!/bin/sh -l

set -e

sh -c "pack build ${INPUT_IMAGE}:${INPUT_TAG} --path ${INPUT_PATH} --builder ${INPUT_BUILDER}"
