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

set "REPO="
set "SKIP_CONFIRM=0"

for %%A in (%*) do (
  if /I "%%~A"=="--yes" (
    set "SKIP_CONFIRM=1"
  ) else if /I "%%~A"=="-y" (
    set "SKIP_CONFIRM=1"
  ) else if /I "%%~A"=="/y" (
    set "SKIP_CONFIRM=1"
  ) else if /I "%%~A"=="--no-prompt" (
    set "SKIP_CONFIRM=1"
  ) else if /I "%%~A"=="/no-prompt" (
    set "SKIP_CONFIRM=1"
  ) else if not defined REPO (
    set "REPO=%%~A"
  )
)

if not defined REPO (
  for /f "delims=" %%R in ('gh repo view --json nameWithOwner --jq ".nameWithOwner" 2^>nul') do set "REPO=%%R"
)

if not defined REPO (
  echo ERROR: Could not determine target repo.
  echo Usage: %~nx0 [OWNER/REPO] [--yes^|-y^|/y^|--no-prompt^|/no-prompt]
  echo Example: %~nx0 octocat/Hello-World --yes
  exit /b 1
)

echo Target repo: %REPO%
echo.
if "%SKIP_CONFIRM%"=="1" (
  echo WARNING: Confirmation prompt skipped by switch.
) else (
  echo WARNING: This will permanently DELETE all currently open issues in %REPO%.
  echo This action is destructive and cannot be undone.
  set /p CONFIRM=Type DELETE to continue: 
  if /I not "%CONFIRM%"=="DELETE" (
    echo Aborted.
    exit /b 1
  )
)

set "COUNT=0"
set "ISSUE_LIST_FILE=%TEMP%\gh-open-issues-%RANDOM%%RANDOM%.txt"
gh issue list -R "%REPO%" --state=open --limit=1000 --json number --jq ".[].number" > "%ISSUE_LIST_FILE%"
if errorlevel 1 (
  echo ERROR: Failed to fetch open issues.
  if exist "%ISSUE_LIST_FILE%" del /q "%ISSUE_LIST_FILE%" >nul 2>&1
  exit /b 1
)

for /f "usebackq delims=" %%I in ("%ISSUE_LIST_FILE%") do (
  set /a COUNT+=1
  echo Deleting issue #%%I...
  gh issue delete %%I -R "%REPO%" --yes
  if errorlevel 1 echo Failed to delete issue #%%I
)

if exist "%ISSUE_LIST_FILE%" del /q "%ISSUE_LIST_FILE%" >nul 2>&1

if "%COUNT%"=="0" (
  echo No open issues found.
) else (
  echo Done. Attempted to delete %COUNT% issue^(s^).
)

endlocal
