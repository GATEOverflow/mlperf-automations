#!/bin/bash

CUR_DIR=${PWD}

echo ""
echo "Current execution path: ${CUR_DIR}"
echo "Path to script: ${MLC_TMP_CURRENT_SCRIPT_PATH}"
echo "ENV MLC_EXPERIMENT: ${MLC_EXPERIMENT}"

if test -f "${MLC_TMP_CURRENT_SCRIPT_PATH}/requirements.txt"; then
  echo ""
  echo "Installing requirements.txt ..."
  echo ""

  ${MLC_PYTHON_BIN_WITH_PATH} -m pip install -r ${MLC_TMP_CURRENT_SCRIPT_PATH}/requirements.txt
  test $? -eq 0 || exit 1
fi
