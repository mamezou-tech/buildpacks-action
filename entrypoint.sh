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

buildpacks=""
if [ -n "$INPUT_BUILDPACKS" ]; then
  arr=(${INPUT_BUILDPACKS})
  for p in "${arr[@]}"
  do
    buildpacks+=" --buildpack "
    buildpacks+='"'$p'"'
  done
fi

command="pack build ${INPUT_IMAGE}:${INPUT_TAG} ${env_str} --path ${INPUT_PATH} ${buildpacks} --builder ${INPUT_BUILDER}"
echo "::set-output name=command::${command}"

sh -c "${command}"
