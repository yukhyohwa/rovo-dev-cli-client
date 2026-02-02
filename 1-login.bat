@echo off
echo ==========================================
echo   Starting Atlassian Rovo Login...
echo ==========================================
cd /d %~dp0
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

.\acli.exe rovodev auth login
echo.
echo ------------------------------------------
echo   Login complete? Press any key to exit.
echo ------------------------------------------
pause
