@echo off
chcp 936 >nul
setlocal EnableExtensions EnableDelayedExpansion
title 遮天 本地测试服
cd /d "%~dp0"

set "ROOT=%~dp0"
if "%ROOT:~-1%"=="\" set "ROOT=%ROOT:~0,-1%"
set "BATROOT=%ROOT:\=/%"
set "ADB=%ROOT%\tools\platform-tools\adb.exe"
set "BASH=C:\Program Files\Git\bin\bash.exe"
set "MYSQLD=%ROOT%\tmp\mariadb\mariadb-10.6.28-winx64\bin\mysqld.exe"
set "TIMEOUT=%SystemRoot%\System32\timeout.exe"
set "WSA=%LOCALAPPDATA%\Microsoft\WindowsApps\MicrosoftCorporationII.WindowsSubsystemForAndroid_8wekyb3d8bbwe\WsaClient.exe"
set "DEV=127.0.0.1:58526"

echo ============================================
echo              遮天 本地测试服
echo ============================================
echo.

rem ---------- 1. MariaDB ----------
netstat -ano | findstr /C:":3306" | findstr /C:"LISTENING" >nul 2>&1
if not errorlevel 1 goto :MYSQL_OK
echo [1/5] 启动 MariaDB ...
start "MariaDB" /min "%MYSQLD%" --datadir="%BATROOT%/YCserver/run/mysql-data" --port=3306 --bind-address=127.0.0.1
for /l %%i in (1,1,20) do (
  netstat -ano | findstr /C:":3306" | findstr /C:"LISTENING" >nul 2>&1
  if not errorlevel 1 goto :MYSQL_OK
  "%TIMEOUT%" /t 1 /nobreak >nul
)
echo        MariaDB 启动超时！
goto :FAIL
:MYSQL_OK
echo        MariaDB 就绪

rem ---------- 2. Erlang ----------
set "ERLN=0"
for /f %%c in ('powershell -NoProfile -Command "(Get-Process erl -ErrorAction SilentlyContinue).Count"') do set "ERLN=%%c"
if %ERLN% GEQ 4 goto :ERL_OK
echo [2/5] 启动 Erlang 服务端（4 个节点，约 15 秒）...
"%BASH%" "%BATROOT%/YCserver/run/start_all.sh"
"%TIMEOUT%" /t 8 /nobreak >nul
set "ERLN=0"
for /f %%c in ('powershell -NoProfile -Command "(Get-Process erl -ErrorAction SilentlyContinue).Count"') do set "ERLN=%%c"
if %ERLN% LSS 4 (
  echo        Erlang 节点不全（!ERLN!/4），请看 YCserver\run\*.out
  goto :FAIL
)
:ERL_OK
echo        Erlang 就绪

rem ---------- 3. HTTP ----------
netstat -ano | findstr /C:":8081" | findstr /C:"LISTENING" >nul 2>&1
if not errorlevel 1 goto :HTTP_OK
echo [3/5] 启动 HTTP 服务 ...
"%BASH%" "%BATROOT%/YCserver/run/start_http.sh"
for /l %%i in (1,1,10) do (
  netstat -ano | findstr /C:":8081" | findstr /C:"LISTENING" >nul 2>&1
  if not errorlevel 1 goto :HTTP_OK
  "%TIMEOUT%" /t 1 /nobreak >nul
)
echo        HTTP 启动超时！
goto :FAIL
:HTTP_OK
echo        HTTP 就绪

rem ---------- 4. WSA / adb ----------
echo [4/5] 连接 WSA ...
set "NEED_BOOT=0"
"%ADB%" devices 2>nul | findstr /C:"%DEV%" | findstr /C:"device" >nul
if not errorlevel 1 goto :DEV_OK
set "NEED_BOOT=1"
echo        WSA 未运行，正在启动（冷启动约 30-60 秒）...
start "" "%WSA%"
call :WAIT_DEVICE
if errorlevel 1 (
  echo        WSA 连接失败，请确认 Windows Subsystem for Android 已安装。
  goto :FAIL
)
:DEV_OK
call :WAIT_READY
if errorlevel 1 (
  echo        WSA 系统未就绪。
  goto :FAIL
)
"%ADB%" -s %DEV% reverse --remove tcp:8081 >nul 2>&1
"%ADB%" -s %DEV% reverse --remove tcp:8001 >nul 2>&1
"%ADB%" -s %DEV% reverse tcp:8081 tcp:8081 >nul
"%ADB%" -s %DEV% reverse tcp:8001 tcp:8001 >nul
echo        端口转发就绪

rem ---------- 5. Game ----------
echo [5/5] 启动游戏 ...
set "GAMEPID="
for /f "delims=" %%p in ('"%ADB%" -s %DEV% shell pidof com.xcqy.ceshi 2^>nul') do set "GAMEPID=%%p"
if not defined GAMEPID (
  start "" "%WSA%" /launch wsa://com.xcqy.ceshi
  echo        已启动游戏，等待窗口出现...
) else (
  echo        游戏已在运行，切换到前台
  powershell -NoProfile -ExecutionPolicy Bypass -File "%ROOT%\YCserver\run\focus_wsa.ps1"
  if errorlevel 1 start "" "%WSA%" /launch wsa://com.xcqy.ceshi
)
echo.
echo 完成。如果游戏里弹出“下载base_setting信息失败”，点“确定”即可。
pause
exit /b 0

rem ---------- Subroutines ----------
:WAIT_DEVICE
set /a TRY=0
:WAIT_DEVICE_LOOP
"%ADB%" connect %DEV% >nul 2>&1
"%ADB%" devices 2>nul | findstr /C:"%DEV%" | findstr /C:"device" >nul
if not errorlevel 1 exit /b 0
set /a TRY+=1
if !TRY! GEQ 60 exit /b 1
"%TIMEOUT%" /t 2 /nobreak >nul
goto :WAIT_DEVICE_LOOP

:WAIT_READY
set /a TRY=0
:WAIT_READY_LOOP
"%ADB%" -s %DEV% shell pm path com.xcqy.ceshi 2>nul | findstr /C:"package:" >nul
if not errorlevel 1 exit /b 0
set /a TRY+=1
if !TRY! GEQ 90 exit /b 1
"%TIMEOUT%" /t 2 /nobreak >nul
goto :WAIT_READY_LOOP

:FAIL
echo.
echo 启动失败，请把上面的信息截图发给开发。
pause
exit /b 1
