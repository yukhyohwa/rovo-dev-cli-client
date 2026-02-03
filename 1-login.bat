@echo off
setlocal enabledelayedexpansion

echo ==========================================
echo   Starting Atlassian Rovo Login...
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

if defined ATLASSIAN_API_TOKEN (
    if defined ATLASSIAN_ACCOUNT_EMAIL (
        echo [INFO] Found credentials in .env, attempting automatic login...
        echo !ATLASSIAN_API_TOKEN! | .\acli.exe rovodev auth login --email !ATLASSIAN_ACCOUNT_EMAIL! --token
    ) else (
        .\acli.exe rovodev auth login
    )
) else (
    .\acli.exe rovodev auth login
)
echo.
echo ------------------------------------------
echo   Login complete? Press any key to exit.
echo ------------------------------------------
pause
