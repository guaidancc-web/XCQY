@echo off
chcp 936 >nul
title 重建任务栏图标缓存
setlocal

echo 这个脚本会重启任务栏（资源管理器），并重建图标缓存。
echo 打开的“文件资源管理器”窗口会被关闭，其他软件不受影响。
echo.
pause

echo 正在关闭资源管理器...
taskkill /f /im explorer.exe >nul 2>&1
"%SystemRoot%\System32\timeout.exe" /t 2 /nobreak >nul

echo 正在删除旧的图标缓存库...
del /f /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\iconcache_*.db" >nul 2>&1
rd /s /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\IconCacheToDelete" >nul 2>&1

echo 正在重启资源管理器...
start explorer.exe

echo.
echo 完成，看一眼任务栏的“遮天”图标。
pause
