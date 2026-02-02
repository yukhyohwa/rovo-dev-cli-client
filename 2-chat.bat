@echo off
echo ==========================================
echo   Entering Atlassian Rovo Chat mode...
echo   (Type 'exit' and press Enter to quit)
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

.\acli.exe rovodev run
pause
