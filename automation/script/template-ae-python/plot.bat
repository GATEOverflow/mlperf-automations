@echo off

set CUR_DIR=%cd%

echo.
echo Current execution path: %CUR_DIR%
echo Path to script: %MLC_TMP_CURRENT_SCRIPT_PATH%
echo ENV MLC_EXPERIMENT: %MLC_EXPERIMENT%

rem echo.
rem %MLC_PYTHON_BIN_WITH_PATH% %MLC_TMP_CURRENT_SCRIPT_PATH%\main.py
rem IF %ERRORLEVEL% NEQ 0 EXIT %ERRORLEVEL%
