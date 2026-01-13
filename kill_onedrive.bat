@echo off
chcp 65001 >nul
title OneDrive Killer

echo ==============================
echo Removing OneDrive...
echo ==============================
timeout /t 2 >nul

:: Kill OneDrive
taskkill /f /im OneDrive.exe >nul 2>&1

:: Uninstall OneDrive
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall >nul 2>&1
%SystemRoot%\System32\OneDriveSetup.exe /uninstall >nul 2>&1

:: Remove leftovers
rmdir /s /q "%UserProfile%\OneDrive"
rmdir /s /q "%localappdata%\Microsoft\OneDrive"
rmdir /s /q "%ProgramData%\Microsoft OneDrive"
rmdir /s /q "C:\OneDriveTemp"

:: Remove from Explorer
reg delete "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f >nul 2>&1
reg delete "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f >nul 2>&1

:: Disable future OneDrive
reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC /t REG_DWORD /d 1 /f >nul 2>&1

echo.
echo ✔ OneDrive completely removed
echo ✔ Will not come back after updates
echo.
pause
