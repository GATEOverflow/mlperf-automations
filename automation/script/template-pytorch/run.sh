#!/bin/bash

CUR_DIR=${PWD}

echo ""
echo "Current execution path: ${CUR_DIR}"
echo "Path to script: ${MLC_TMP_CURRENT_SCRIPT_PATH}"
echo "ENV PIP_REQUIREMENTS: ${PIP_REQUIREMENTS}"
echo "ENV MLC_VAR1: ${MLC_VAR1}"

if [ "${PIP_REQUIREMENTS}" == "True" ]; then
  if test -f "${MLC_TMP_CURRENT_SCRIPT_PATH}/requirements.txt"; then
    echo ""
    echo "Installing requirements.txt ..."
    echo ""

    ${MLC_PYTHON_BIN_WITH_PATH} -m pip install -r ${MLC_TMP_CURRENT_SCRIPT_PATH}/requirements.txt
    test $? -eq 0 || exit 1
  fi
fi

echo ""
${MLC_PYTHON_BIN_WITH_PATH} ${MLC_TMP_CURRENT_SCRIPT_PATH}/main.py
test $? -eq 0 || exit 1
