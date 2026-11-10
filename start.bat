@echo off
setlocal
rem Start local Hugo blog server, reachable only from the hotspot LAN (192.168.137.x).
rem Falls back to localhost-only when the hotspot adapter is absent.
rem Stop: close the "Hugo Blog Server" window.

cd /d "%~dp0"

set "HUGO=C:\Users\Administrator\tools\hugo\hugo.exe"
if not exist "%HUGO%" set "HUGO=..\..\tools\hugo\hugo.exe"
if not exist "%HUGO%" (
    echo [ERROR] hugo.exe not found. Please install Hugo first.
    pause
    exit /b 1
)

rem Detect hotspot adapter 192.168.137.1; bind only to it when present
ping -n 1 -w 300 192.168.137.1 >nul 2>&1
if not errorlevel 1 (
    set "BIND=192.168.137.1"
    set "OPEN_URL=http://192.168.137.1:1313/"
    echo Hotspot LAN detected. Blog visible only to devices on 192.168.137.x
) else (
    set "BIND=127.0.0.1"
    set "OPEN_URL=http://localhost:1313/"
    echo Hotspot adapter 192.168.137.1 not found. Server falls back to localhost only.
)

echo Starting blog server (bind %BIND%) ...
start "Hugo Blog Server" "%HUGO%" server --bind %BIND% --port 1313 --disableFastRender

ping -n 4 127.0.0.1 >nul
start "" %OPEN_URL%

echo Server window "Hugo Blog Server" is running. Close it to stop the server.
endlocal