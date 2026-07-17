@echo off
setlocal EnableExtensions

set "REPO=%~1"

echo Deleting all OPEN issues without prompt...
if defined REPO (
  call "%~dp0delete-all-open-issues.bat" "%REPO%" --yes
) else (
  call "%~dp0delete-all-open-issues.bat" --yes
)
if errorlevel 1 (
  echo ERROR: Failed while deleting open issues.
  exit /b 1
)

echo.
echo Deleting all CLOSED issues without prompt...
if defined REPO (
  call "%~dp0delete-all-closed-issues.bat" "%REPO%" --yes
) else (
  call "%~dp0delete-all-closed-issues.bat" --yes
)
if errorlevel 1 (
  echo ERROR: Failed while deleting closed issues.
  exit /b 1
)

echo.
echo Done. Requested deletion for all open and closed issues.
endlocal
