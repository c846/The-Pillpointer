@echo off
echo ==========================================
echo                    Installing The Pillpointer!
echo ==========================================

:: Passes the path of the 'files' folder into the PowerShell script as an argument
powershell.exe -ExecutionPolicy Bypass -File "%~dp0files\script.ps1" -SourceDir "%~dp0files"

pause