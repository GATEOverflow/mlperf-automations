@echo off

set CUR_DIR=%cd%

echo.
echo Current execution path: %CUR_DIR%
echo Path to script: %MLC_TMP_CURRENT_SCRIPT_PATH%
echo ENV MLC_EXPERIMENT: %MLC_EXPERIMENT%

if exist "%MLC_TMP_CURRENT_SCRIPT_PATH%\requirements.txt" (

  echo.
  echo Installing requirements.txt ...
  echo.

  %MLC_PYTHON_BIN_WITH_PATH% -m pip install -r %MLC_TMP_CURRENT_SCRIPT_PATH%\requirements.txt
  IF %ERRORLEVEL% NEQ 0 EXIT %ERRORLEVEL%
)
