@echo off
title SSH File Downloader

set /p user="Username: "
set /p ip="Server-IP: "
set /p r_path="Path to the file on your server (Spaces in name Unsupported): "
set /p l_path="Local destination folder (Leave empty for [%CD%]): "

if "%l_path%"=="" set l_path=.

echo.
echo [OK] Starting Download...
scp %user%@%ip%:%r_path% %l_path%

echo.
echo [COMPLETE] Press any button to exit...
pause >nul
