@echo off
echo ===========================================
echo    Atlassian ACLI 下载/更新程序
echo ===========================================
echo.
echo 正在从 Atlassian 官网下载最新的 acli.exe...
curl.exe -L https://acli.atlassian.com/windows/latest/acli_windows_amd64/acli.exe -o acli.exe

if %errorlevel% neq 0 (
    echo [错误] 下载失败，请检查网络连接。
) else (
    echo [成功] acli.exe 下载完成！
)
echo.
pause
