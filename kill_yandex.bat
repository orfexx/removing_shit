@echo off
@echo off
chcp 65001 >nul
title Yandex Browser Killer

echo ==============================
echo Removing Yandex Browser...
echo ==============================
timeout /t 2 >nul

:: Kill processes
taskkill /f /im browser.exe >nul 2>&1
taskkill /f /im yandex.exe >nul 2>&1
taskkill /f /im yandexbrowser.exe >nul 2>&1

:: Uninstall browser
wmic product where "name like '%%Yandex%%Browser%%'" call uninstall /nointeractive >nul 2>&1

:: Delete leftovers
rmdir /s /q "C:\Program Files\Yandex\YandexBrowser"
rmdir /s /q "C:\Program Files (x86)\Yandex\YandexBrowser"
rmdir /s /q "%localappdata%\Yandex\YandexBrowser"
rmdir /s /q "%appdata%\Yandex\YandexBrowser"

:: Remove updater
sc stop yandexupdate >nul 2>&1
sc delete yandexupdate >nul 2>&1
sc stop yandexupdater >nul 2>&1
sc delete yandexupdater >nul 2>&1

:: Remove scheduled tasks
schtasks /delete /tn "YandexBrowserUpdate" /f >nul 2>&1
schtasks /delete /tn "YandexUpdater" /f >nul 2>&1

echo.
echo ✔ Yandex Browser removed
echo ✔ Yandex Disk not touched
echo.
pause

