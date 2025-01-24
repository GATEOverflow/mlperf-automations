#!/bin/bash
CUR=$PWD

cd ${MLC_MLPERF_INFERENCE_NVIDIA_CODE_PATH}

if [[ ${MLC_MAKE_CLEAN} == "yes" ]]; then
  make clean
fi

if [[ ${MLC_MLPERF_DEVICE} == "inferentia" ]]; then
 make prebuild
fi

SKIP_DRIVER_CHECK=1 make ${MLC_MAKE_BUILD_COMMAND}

test $? -eq 0 || exit $?
