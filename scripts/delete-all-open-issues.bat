@echo off
setlocal EnableExtensions EnableDelayedExpansion

where gh >nul 2>&1
if errorlevel 1 (
  echo ERROR: GitHub CLI ^(gh^) is not installed or not on PATH.
  exit /b 1
)

gh auth status >nul 2>&1
if errorlevel 1 (
  echo ERROR: You are not authenticated. Run: gh auth login
  exit /b 1
)

set "REPO=%~1"
set "REPO_ARG="

if defined REPO (
  set "REPO_ARG=-R %REPO%"
) else (
  for /f "delims=" %%R in ('gh repo view --json nameWithOwner --jq ".nameWithOwner" 2^>nul') do set "REPO=%%R"
  if defined REPO set "REPO_ARG=-R %REPO%"
)

if not defined REPO (
  echo ERROR: Could not determine target repo.
  echo Usage: %~nx0 OWNER/REPO
  echo Example: %~nx0 octocat/Hello-World
  exit /b 1
)

echo Target repo: %REPO%
echo.
echo WARNING: This will permanently DELETE all currently open issues in %REPO%.
echo This action is destructive and cannot be undone.
set /p CONFIRM=Type DELETE to continue: 
if /I not "%CONFIRM%"=="DELETE" (
  echo Aborted.
  exit /b 1
)

set "COUNT=0"
for /f "usebackq delims=" %%I in (`gh issue list %REPO_ARG% --state open --limit 1000 --json number --jq ".[].number"`) do (
  set /a COUNT+=1
  echo Deleting issue #%%I...
  gh issue delete %%I %REPO_ARG% --yes
  if errorlevel 1 echo Failed to delete issue #%%I
)

if "%COUNT%"=="0" (
  echo No open issues found.
) else (
  echo Done. Attempted to delete %COUNT% issue^(s^).
)

endlocal
