#!/bin/bash -l

set -e

env_str=""
if [ -n "$INPUT_ENV" ]; then
  arr=(${INPUT_ENV})

  for e in "${arr[@]}"
  do
    env_str+=" --env "
    env_str+='"'$e'"'
  done
fi
echo ${env_str}

sh -c "pack build ${INPUT_IMAGE}:${INPUT_TAG} ${env_str} --path ${INPUT_PATH} --builder ${INPUT_BUILDER}"
