@echo off
chcp 65001 >nul
title Mail.ru Killer

echo ==============================
echo Removing Mail.ru products...
echo ==============================
timeout /t 2 >nul

:: Kill processes
taskkill /f /im amigo.exe >nul 2>&1
taskkill /f /im mailru.exe >nul 2>&1
taskkill /f /im guard.exe >nul 2>&1
taskkill /f /im sputnik.exe >nul 2>&1
taskkill /f /im vk.exe >nul 2>&1

:: Uninstall by name
wmic product where "name like '%%Mail%%'" call uninstall /nointeractive >nul 2>&1
wmic product where "name like '%%Amigo%%'" call uninstall /nointeractive >nul 2>&1
wmic product where "name like '%%Sputnik%%'" call uninstall /nointeractive >nul 2>&1
wmic product where "name like '%%Guard%%'" call uninstall /nointeractive >nul 2>&1
wmic product where "name like '%%VK%%'" call uninstall /nointeractive >nul 2>&1

:: Delete folders
rmdir /s /q "C:\Program Files\Mail.Ru"
rmdir /s /q "C:\Program Files (x86)\Mail.Ru"
rmdir /s /q "C:\Program Files\Amigo"
rmdir /s /q "C:\Program Files (x86)\Amigo"
rmdir /s /q "C:\Program Files\Sputnik"
rmdir /s /q "C:\Program Files (x86)\Sputnik"
rmdir /s /q "C:\ProgramData\Mail.Ru"
rmdir /s /q "%localappdata%\Mail.Ru"
rmdir /s /q "%appdata%\Mail.Ru"

:: Remove scheduled tasks
schtasks /delete /tn "MailRuUpdater" /f >nul 2>&1
schtasks /delete /tn "AmigoUpdate" /f >nul 2>&1
schtasks /delete /tn "SputnikUpdate" /f >nul 2>&1

echo.
echo ✔ Mail.ru, Amigo, Sputnik removed
echo ✔ System cleaned
echo.
pause
