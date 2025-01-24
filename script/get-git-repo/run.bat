@echo off

rem echo ******************************************************
rem echo Cloning MLCommons from %MLC_GIT_URL% with branch %MLC_GIT_CHECKOUT% %MLC_GIT_DEPTH% %MLC_GIT_RECURSE_SUBMODULES% ...

rem git clone %MLC_GIT_RECURSE_SUBMODULES% %MLC_GIT_URL% %MLC_GIT_DEPTH% inference
rem cd inference
rem git checkout -b "%MLC_GIT_CHECKOUT%"
rem

rem Next line allows ERRORLEVEL inside if statements!
setlocal enabledelayedexpansion

set CUR_DIR=%cd%
set SCRIPT_DIR=%MLC_TMP_CURRENT_SCRIPT_PATH%

set folder=%MLC_GIT_CHECKOUT_FOLDER%

if not exist "%MLC_TMP_GIT_PATH%" (

  if exist "%folder%" (
    rmdir /S /Q "%folder%"  rem Use rmdir instead of deltree
  )
  
  echo ******************************************************
  echo Current directory: %CUR_DIR%
  echo.
  echo Cloning %MLC_GIT_REPO_NAME% from %MLC_GIT_URL%
  echo.
  echo "%MLC_GIT_CLONE_CMD%"
  echo.
  
  %MLC_GIT_CLONE_CMD%
  IF !ERRORLEVEL! NEQ 0 EXIT !ERRORLEVEL!
  
  cd "%folder%"
  
  if not "%MLC_GIT_SHA%" == "" (
       echo.
       echo.
       git checkout "%MLC_GIT_CHECKOUT%"
       IF !ERRORLEVEL! NEQ 0 EXIT !ERRORLEVEL!
  )

) else (
  cd "%folder%"
)

if not "%MLC_GIT_SUBMODULES%" == "" (
  for /F %%s in ("%MLC_GIT_SUBMODULES%") do (
    echo.
    echo Initializing submodule %%s
    git submodule update --init %%s
    IF !ERRORLEVEL! NEQ 0 EXIT !ERRORLEVEL!
  )
)

if "%MLC_GIT_PATCH%" == "yes" (
   for %%x in (%MLC_GIT_PATCH_FILEPATHS%) do (
       echo.
       echo Applying patch %%x ...
       git apply %%x
       IF !ERRORLEVEL! NEQ 0 EXIT !ERRORLEVEL!
   )
)

cd "%CUR_DIR%"

exit /b 0

