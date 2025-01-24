#!/bin/bash
cmd=${MLC_RUN_CMD}
echo "${cmd}"
eval "${cmd}"
test $? -eq 0 || exit $?

cmd=${MLC_POST_RUN_CMD}
echo "${cmd}"
eval "${cmd}"
test $? -eq 0 || exit $?

${MLC_PYTHON_BIN_WITH_PATH} ${MLC_TMP_CURRENT_SCRIPT_PATH}/code.py
test $? -eq 0 || exit $?
