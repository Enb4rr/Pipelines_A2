@echo off
setlocal enabledelayedexpansion

::  setup
::  Run on your Windows machine before pushing to GitHub

set LOGFILE=setup.log

echo  Setup Log >> %LOGFILE%
echo  Date: %DATE% %TIME% >> %LOGFILE%

:: STEP 1: Check that Node.js is installed
echo [STEP 1] Checking for Node.js...
echo [STEP 1] Checking for Node.js... >> %LOGFILE%

node --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Node.js is not installed or not in PATH
    echo [ERROR] Node.js not found >> %LOGFILE%
    pause
    exit /b 1
)

for /f "tokens=*" %%v in ('node --version') do set NODE_VERSION=%%v
echo [SUCCESS] Node.js found: %NODE_VERSION%
echo [SUCCESS] Node.js found: %NODE_VERSION% >> %LOGFILE%

:: STEP 2: Check that npm is installed
echo.
echo [STEP 2] Checking for npm...
echo [STEP 2] Checking for npm... >> %LOGFILE%

npm --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] npm is not available
    echo [ERROR] npm not found >> %LOGFILE%
    pause
    exit /b 1
)

for /f "tokens=*" %%v in ('npm --version') do set NPM_VERSION=%%v
echo [SUCCESS] npm found: v%NPM_VERSION%
echo [SUCCESS] npm found: v%NPM_VERSION% >> %LOGFILE%

:: STEP 3: Check that package.json exists
echo.
echo [STEP 3] Checking for package.json...
echo [STEP 3] Checking for package.json... >> %LOGFILE%

if not exist "package.json" (
    echo [ERROR] package.json not found
    echo [ERROR] package.json not found in current directory >> %LOGFILE%
    pause
    exit /b 1
)

echo [SUCCESS] package.json found
echo [SUCCESS] package.json found >> %LOGFILE%

:: STEP 4: Install dependencies
echo.
echo [STEP 4] Installing dependencies (npm install)...
echo [STEP 4] Running npm install... >> %LOGFILE%

npm install >> %LOGFILE% 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] npm install failed. Check setup.log for details
    echo [ERROR] npm install failed >> %LOGFILE%
    pause
    exit /b 1
)

echo [SUCCESS] Dependencies installed
echo [SUCCESS] Dependencies installed >> %LOGFILE%

:: DONE
echo.
echo   Setup complete!
echo.
echo  Next steps:
echo    1. Make sure vite.config.js has:
echo       base: '/your-repo-name/'
echo.
echo    2. Commit and push to the main branch:
echo       git add .
echo       git commit -m "your message"
echo       git push origin main
echo.
echo    3. GitHub Actions will automatically
echo       build and deploy your app.
echo.
echo    4. Check the Actions tab on GitHub
echo       to monitor the pipeline.
echo.
echo  A log of this setup has been saved to: setup.log
echo.
echo [DONE] Setup complete >> %LOGFILE%

pause
