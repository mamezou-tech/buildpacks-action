#!/bin/sh -l

set -e

env_str=""
if [ -n "$INPUT_ENV" ]; then
  read -r -a arr <<< "$INPUT_ENV"

  for e in "${arr[@]}"
  do
    env_str+=" --env "
    env_str+='"'$e'"'
  done
fi

command="pack build ${INPUT_IMAGE}:${INPUT_TAG} ${env_str} --path ${INPUT_PATH} --builder ${INPUT_BUILDER}"
echo "::set-output name=command::$command"

sh -c $command
