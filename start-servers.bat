@echo off
echo ========================================
echo   Employee Attendance System
echo   Starting Backend and Frontend Servers
echo ========================================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

REM Check if backend node_modules exists
if not exist "backend\node_modules" (
    echo Installing backend dependencies...
    cd backend
    call npm install
    cd ..
)

REM Check if frontend node_modules exists
if not exist "frontend\node_modules" (
    echo Installing frontend dependencies...
    cd frontend
    call npm install
    cd ..
)

REM Check if .env files exist
if not exist "backend\.env" (
    echo WARNING: backend\.env file not found!
    echo Please create backend\.env file with:
    echo   MONGODB_URI=mongodb://localhost:27017/employee_attendance
    echo   PORT=5000
    echo   JWT_SECRET=your_super_secret_jwt_key_change_this_in_production
    echo.
)

if not exist "frontend\.env" (
    echo WARNING: frontend\.env file not found!
    echo Please create frontend\.env file with:
    echo   REACT_APP_API_URL=http://localhost:5000/api
    echo.
)

echo Starting Backend Server...
start "Backend Server" cmd /k "cd backend && npm start"

timeout /t 3 /nobreak >nul

echo Starting Frontend Server...
start "Frontend Server" cmd /k "cd frontend && npm start"

echo.
echo ========================================
echo   Servers are starting...
echo   Backend: http://localhost:5000
echo   Frontend: http://localhost:3000
echo ========================================
echo.
echo Press any key to exit (servers will continue running)...
pause >nul


