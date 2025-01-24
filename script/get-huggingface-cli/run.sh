#!/bin/bash
if  [[ -n ${MLC_HF_LOGIN_CMD} ]]; then
  echo "${MLC_HF_LOGIN_CMD}"
  eval ${MLC_HF_LOGIN_CMD}
  test $? -eq 0 || exit $?
fi
huggingface-cli version > tmp-ver.out
