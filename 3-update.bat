@echo off
echo ===========================================
echo    Atlassian ACLI Download/Update
echo ===========================================
echo.
echo Downloading latest acli.exe from Atlassian...
curl.exe -L https://acli.atlassian.com/windows/latest/acli_windows_amd64/acli.exe -o acli.exe

if %errorlevel% neq 0 (
    echo [ERROR] Download failed. Please check your internet connection.
) else (
    echo [SUCCESS] acli.exe download complete!
)
echo.
pause
