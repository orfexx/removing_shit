@echo off
chcp 65001 >nul
title Driver Booster Killer

echo ==============================
echo Removing Driver Booster...
echo ==============================
timeout /t 2 >nul

:: Kill processes
taskkill /f /im DriverBooster.exe >nul 2>&1
taskkill /f /im IObitUnSvr.exe >nul 2>&1
taskkill /f /im IObitTray.exe >nul 2>&1
taskkill /f /im IObitUpdate.exe >nul 2>&1

:: Stop services
sc stop "Driver Booster Service" >nul 2>&1
sc stop "IObit Update Service" >nul 2>&1

:: Uninstall Driver Booster
wmic product where "name like '%%Driver Booster%%'" call uninstall /nointeractive >nul 2>&1

:: Delete leftovers
rmdir /s /q "C:\Program Files\IObit"
rmdir /s /q "C:\Program Files (x86)\IObit"
rmdir /s /q "C:\ProgramData\IObit"
rmdir /s /q "%localappdata%\IObit"
rmdir /s /q "%appdata%\IObit"

:: Remove services
sc delete "Driver Booster Service" >nul 2>&1
sc delete "IObit Update Service" >nul 2>&1

:: Remove scheduled tasks
schtasks /delete /tn "IObit Update" /f >nul 2>&1
schtasks /delete /tn "Driver Booster SkipUAC" /f >nul 2>&1

echo.
echo ✔ Driver Booster removed
echo ✔ No more fake driver warnings
echo.
pause
