@echo off
setlocal
rem Start local Hugo blog server and open browser.
rem URL: http://localhost:1313/  (also reachable from LAN devices via this PC's IP)
rem Stop: close the "Hugo Blog Server" window.

cd /d "%~dp0"

set "HUGO=C:\Users\Administrator\tools\hugo\hugo.exe"
if not exist "%HUGO%" set "HUGO=..\..\tools\hugo\hugo.exe"
if not exist "%HUGO%" (
    echo [ERROR] hugo.exe not found. Please install Hugo first.
    pause
    exit /b 1
)

echo Starting local blog server at http://localhost:1313/ ...
start "Hugo Blog Server" "%HUGO%" server --bind 0.0.0.0 --port 1313 --disableFastRender

ping -n 4 127.0.0.1 >nul
start "" http://localhost:1313/

echo Server window "Hugo Blog Server" is running. Close it to stop the server.
endlocal