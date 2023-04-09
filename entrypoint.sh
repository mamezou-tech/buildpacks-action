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

env_files_str=""
if [ -n "$INPUT_ENV_FILES" ]; then
  arr=(${INPUT_ENV_FILES})
  for e in "${arr[@]}"
  do
    env_files_str+=" --env-file "
    env_files_str+='"'$e'"'
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

publish=""
if [ -n "$INPUT_PUBLISH" ]; then
  publish="--publish"
fi

command="pack build ${INPUT_IMAGE}:${INPUT_TAG} ${env_str} ${env_files_str} --path ${INPUT_PATH} ${buildpacks} --builder ${INPUT_BUILDER} ${publish}"
echo "command=${command}" >> $GITHUB_OUTPUT

if [ "$INPUT_DEBUG_MODE" = "true" ]; then
  echo "Running in debug mode"
  echo "command = ${command}"
else
  sh -c "${command}"
fi
