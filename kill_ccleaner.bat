@echo off
chcp 65001 >nul
title CCleaner Killer

echo ==============================
echo Removing CCleaner...
echo ==============================
timeout /t 2 >nul

:: Kill CCleaner processes
taskkill /f /im ccsetup.exe >nul 2>&1
taskkill /f /im ccleaner.exe >nul 2>&1
taskkill /f /im ccleaner64.exe >nul 2>&1

:: Stop CCleaner services
sc stop CCleanerPerformanceOptimizerService >nul 2>&1
sc stop CCleanerBrowserMonitoring >nul 2>&1

:: Uninstall CCleaner
wmic product where "name like '%%CCleaner%%'" call uninstall /nointeractive >nul 2>&1

:: Delete leftovers
rmdir /s /q "C:\Program Files\CCleaner"
rmdir /s /q "C:\Program Files (x86)\CCleaner"
rmdir /s /q "C:\ProgramData\CCleaner"
rmdir /s /q "%localappdata%\CCleaner"
rmdir /s /q "%appdata%\CCleaner"

:: Remove services
sc delete CCleanerPerformanceOptimizerService >nul 2>&1
sc delete CCleanerBrowserMonitoring >nul 2>&1

echo.
echo ✔ CCleaner removed
echo ✔ No telemetry, no background junk
echo.
pause
