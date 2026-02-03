@echo off
setlocal enabledelayedexpansion

echo ==========================================
echo   Entering Atlassian Rovo Chat mode...
echo   (Type 'exit' and press Enter to quit)
echo ==========================================

cd /d %~dp0

:: Load .env file if it exists
if exist .env (
    for /f "usebackq tokens=*" %%a in (".env") do (
        set line=%%a
        if not "!line:~0,1!"=="#" (
            set "%%a"
        )
    )
)

where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git not found!
    echo ------------------------------------------
    echo Git is required for code management.
    echo Please download and install it from:
    echo https://git-scm.com/download/win
    echo ------------------------------------------
    pause
    exit /b
)

.\acli.exe rovodev run
pause
