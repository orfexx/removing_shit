@echo off
chcp 65001 >nul
title Avast Killer

echo ==============================
echo Removing Avast Antivirus...
echo ==============================
timeout /t 2 >nul

:: Kill Avast processes
taskkill /f /im avastui.exe >nul 2>&1
taskkill /f /im avastsvc.exe >nul 2>&1
taskkill /f /im aswEngSrv.exe >nul 2>&1
taskkill /f /im aswToolsSvc.exe >nul 2>&1

:: Stop services
sc stop avast! Antivirus >nul 2>&1
sc stop avastsvc >nul 2>&1
sc stop aswEngSrv >nul 2>&1

:: Run Avast uninstaller
wmic product where "name like '%%Avast%%'" call uninstall /nointeractive >nul 2>&1

:: Delete leftovers
rmdir /s /q "C:\Program Files\Avast Software"
rmdir /s /q "C:\Program Files (x86)\Avast Software"
rmdir /s /q "C:\ProgramData\Avast Software"
rmdir /s /q "%localappdata%\Avast Software"
rmdir /s /q "%appdata%\Avast Software"

:: Remove drivers
sc delete aswEngSrv >nul 2>&1
sc delete avastsvc >nul 2>&1
sc delete aswToolsSvc >nul 2>&1

echo.
echo ✔ Avast removed
echo ✔ System cleaned
echo.
pause
