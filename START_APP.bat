@echo off
echo ========================================
echo   EMPLOYEE ATTENDANCE SYSTEM
echo ========================================
echo.
echo Starting Backend Server...
start "Backend Server" cmd /k "cd backend && npm run dev"
timeout /t 3 /nobreak >nul

echo Starting Frontend Server...
start "Frontend Server" cmd /k "cd frontend && npm start"
timeout /t 5 /nobreak >nul

echo.
echo ========================================
echo   SERVERS STARTED
echo ========================================
echo.
echo Backend:  http://localhost:5000
echo Frontend: http://localhost:3000
echo.
echo Two command windows have opened:
echo   - Backend Server (shows logs)
echo   - Frontend Server (compiles React)
echo.
echo Browser will open automatically in 30-60 seconds
echo If not, manually visit: http://localhost:3000
echo.
pause



