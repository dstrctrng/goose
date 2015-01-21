#!/usr/bin/env bash

function require_goose { 
  local shome="$(unset CDPATH; cd -P -- "$(dirname -- "$BASH_SOURCE")" && pwd -P)"
  pushd $shome > /dev/null
  source $shome/exec/_goose
  popd > /dev/null

  PATH=$PATH:$shome/bin:$shome/exec
}

require_goose
