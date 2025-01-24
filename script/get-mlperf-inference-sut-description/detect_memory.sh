#!/bin/bash

if [[ ${MLC_SUDO_USER} == "yes" ]]; then
  ${MLC_SUDO} dmidecode -t memory > meminfo.out
  ${MLC_PYTHON_BIN_WITH_PATH} ${MLC_TMP_CURRENT_SCRIPT_PATH}/get_memory_info.py
fi
test $? -eq 0 || return $?
