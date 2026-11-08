@echo off
cd /d "%~dp0"
title QuantPulse AI - Real-Time Stock Market Launcher
echo ====================================================================
echo   QuantPulse AI: Real-Time Stock Market Intelligence Platform
echo ====================================================================
echo.

if exist ".venv\Scripts\python.exe" (
    set "PY_CMD=.venv\Scripts\python.exe"
) else (
    set "PY_CMD=python"
)

echo [1/2] Initializing Real-Time FastAPI Market Gateway on port 8000...
start "QuantPulse Real-Time API" %PY_CMD% backend/main.py
echo.
echo [2/2] Launching interactive interface in your browser...
timeout /t 2 /nobreak > nul
start index.html
echo.
echo ====================================================================
echo   Live system active!
echo   - Local Dashboard: http://127.0.0.1:8000
echo   - Team Default Password: quantpulse2026
echo   - Swagger API Docs: http://127.0.0.1:8000/docs
echo ====================================================================
