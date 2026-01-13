@echo off
chcp 65001 >nul
title Interactive App Remover

:menu
cls
echo ==============================
echo      SELECT APP TO REMOVE
echo ==============================
echo.
echo 1 - Yandex Browser
echo 2 - Avast / AVG
echo 3 - McAfee
echo 4 - Mail.ru / Amigo
echo 5 - CCleaner
echo 6 - OneDrive
echo 7 - Driver Booster
echo 0 - Exit
echo.
set /p choice=Enter number: 

if "%choice%"=="1" goto yandex
if "%choice%"=="2" goto avast
if "%choice%"=="3" goto mcafee
if "%choice%"=="4" goto mailru
if "%choice%"=="5" goto ccleaner
if "%choice%"=="6" goto onedrive
if "%choice%"=="7" goto driverbooster
if "%choice%"=="0" exit
goto menu

:yandex
taskkill /f /im browser.exe >nul 2>&1
wmic product where "name like '%%Yandex%%Browser%%'" call uninstall /nointeractive
rmdir /s /q "C:\Program Files\Yandex"
rmdir /s /q "C:\Program Files (x86)\Yandex"
pause
goto menu

:avast
taskkill /f /im avastui.exe >nul 2>&1
wmic product where "name like '%%Avast%%'" call uninstall /nointeractive
rmdir /s /q "C:\Program Files\Avast Software"
pause
goto menu

:mcafee
taskkill /f /im mcafee.exe >nul 2>&1
wmic product where "name like '%%McAfee%%'" call uninstall /nointeractive
rmdir /s /q "C:\Program Files\McAfee"
pause
goto menu

:mailru
taskkill /f /im amigo.exe >nul 2>&1
wmic product where "name like '%%Mail%%'" call uninstall /nointeractive
rmdir /s /q "C:\Program Files\Mail.Ru"
pause
goto menu

:ccleaner
taskkill /f /im ccleaner.exe >nul 2>&1
wmic product where "name like '%%CCleaner%%'" call uninstall /nointeractive
rmdir /s /q "C:\Program Files\CCleaner"
pause
goto menu

:onedrive
taskkill /f /im OneDrive.exe >nul 2>&1
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
pause
goto menu

:driverbooster
taskkill /f /im DriverBooster.exe >nul 2>&1
wmic product where "name like '%%Driver Booster%%'" call uninstall /nointeractive
rmdir /s /q "C:\Program Files\IObit"
pause
goto menu
