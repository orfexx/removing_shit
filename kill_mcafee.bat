@echo off
chcp 65001 >nul
title McAfee Killer

echo ==============================
echo Removing McAfee...
echo ==============================
timeout /t 2 >nul

:: Kill processes
taskkill /f /im mcafee.exe >nul 2>&1
taskkill /f /im mcshield.exe >nul 2>&1
taskkill /f /im mfemms.exe >nul 2>&1
taskkill /f /im mfevtps.exe >nul 2>&1

:: Stop services
sc stop McAfeeFramework >nul 2>&1
sc stop McShield >nul 2>&1
sc stop mfevtp >nul 2>&1
sc stop mfemms >nul 2>&1

:: Uninstall McAfee
wmic product where "name like '%%McAfee%%'" call uninstall /nointeractive >nul 2>&1

:: Delete leftovers
rmdir /s /q "C:\Program Files\McAfee"
rmdir /s /q "C:\Program Files (x86)\McAfee"
rmdir /s /q "C:\ProgramData\McAfee"
rmdir /s /q "%localappdata%\McAfee"
rmdir /s /q "%appdata%\McAfee"

:: Remove drivers & services
sc delete McAfeeFramework >nul 2>&1
sc delete McShield >nul 2>&1
sc delete mfevtp >nul 2>&1
sc delete mfemms >nul 2>&1

echo.
echo ✔ McAfee removed
echo ✔ Windows Defender will turn on
echo.
pause
