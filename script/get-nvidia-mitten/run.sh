#!/bin/bash
cd ${MLC_NVIDIA_MITTEN_SRC}
${MLC_PYTHON_BIN_WITH_PATH} -m pip install .
test $? -eq 0 || exit $?
