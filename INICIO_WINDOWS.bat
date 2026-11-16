@echo off
cd /d "%~dp0"
where py >nul 2>nul || (echo Instala Python 3.12 desde python.org antes de continuar. & pause & exit /b 1)
if not exist .venv\Scripts\python.exe py -3 -m venv .venv
call .venv\Scripts\activate.bat
python -m pip install -r requirements.txt
if errorlevel 1 (pause & exit /b 1)
if not defined OPENAI_API_KEY set /p OPENAI_API_KEY=Clave API OpenAI (no se guarda): 
if not defined APP_PASSWORD set /p APP_PASSWORD=Contrasena privada de acceso (elige una robusta): 
if not defined OPENAI_API_KEY (echo Falta la clave. & pause & exit /b 1)
if not defined APP_PASSWORD (echo Falta la contrasena. & pause & exit /b 1)
echo Abre http://localhost:8000 en este equipo. En la misma red, usa la IPv4 que muestra ipconfig, puerto 8000.
python app.py
pause
