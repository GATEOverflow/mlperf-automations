@echo off

%MLC_PYTHON_BIN% %MLC_TMP_CURRENT_SCRIPT_PATH%\preprocess.py
IF %ERRORLEVEL% NEQ 0 EXIT %ERRORLEVEL%
