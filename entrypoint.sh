#!/bin/bash -l

set -e

env_str=""
if [ -n "$INPUT_ENV" ]; then
  arr=(${INPUT_ENV})

  for e in "${arr[@]}"
  do
    env_str+=" --env $e"
  done
fi

command="pack build ${INPUT_IMAGE}:${INPUT_TAG} --path ${INPUT_PATH} --builder ${INPUT_BUILDER}"
echo $command

echo "::set-output name=command::$command"

sh -c $command
