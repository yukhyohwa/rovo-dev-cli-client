@echo off
echo ==========================================
echo   正在进入 Atlassian Rovo 对话模式...
echo   (如果想结束聊天，输入 exit 然后按回车)
echo ==========================================
cd /d %~dp0
.\acli.exe rovodev run
pause
