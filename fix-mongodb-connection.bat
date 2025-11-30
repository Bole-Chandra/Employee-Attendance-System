@echo off
echo ========================================
echo   MongoDB Connection Setup
echo ========================================
echo.
echo Choose your MongoDB setup:
echo.
echo 1. MongoDB Atlas (Cloud - Recommended)
echo 2. Local MongoDB
echo 3. Exit
echo.
set /p choice="Enter choice (1-3): "

if "%choice%"=="1" goto atlas
if "%choice%"=="2" goto local
if "%choice%"=="3" goto end
goto invalid

:atlas
echo.
echo ========================================
echo   MongoDB Atlas Setup
echo ========================================
echo.
echo If you don't have MongoDB Atlas account:
echo 1. Go to: https://www.mongodb.com/cloud/atlas/register
echo 2. Create free account
echo 3. Create free cluster (M0)
echo 4. Create database user (Database Access)
echo 5. Allow network access (Network Access - Add IP or Allow from anywhere)
echo 6. Get connection string (Database - Connect - Connect your application)
echo.
echo Connection string format:
echo mongodb+srv://username:password@cluster0.xxxxx.mongodb.net/?retryWrites=true^&w=majority
echo.
set /p CONN_STRING="Paste your MongoDB Atlas connection string: "

if "%CONN_STRING%"=="" (
    echo No connection string provided.
    pause
    exit /b 1
)

REM Add database name
echo %CONN_STRING% | findstr /C:"employee_attendance" >nul
if errorlevel 1 (
    set CONN_STRING=%CONN_STRING:?=/employee_attendance?%
)

goto write_env

:local
echo.
echo ========================================
echo   Local MongoDB Setup
echo ========================================
echo.
echo Make sure MongoDB is installed and running:
echo Download: https://www.mongodb.com/try/download/community
echo.
set CONN_STRING=mongodb://localhost:27017/employee_attendance
echo Using: %CONN_STRING%
echo.
goto write_env

:write_env
echo.
echo Creating backend/.env file...
(
echo MONGODB_URI=%CONN_STRING%
echo PORT=5000
echo JWT_SECRET=your_super_secret_jwt_key_change_this_in_production_please_change_in_production
) > backend\.env

echo ✅ Created backend/.env
echo.
echo Testing connection...
cd backend
node test-mongodb.js
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✅ Connection successful!
    echo.
    set /p seed_choice="Do you want to seed the database now? (y/n): "
    if /i "%seed_choice%"=="y" (
        echo.
        echo Seeding database...
        npm run seed
    )
) else (
    echo.
    echo ❌ Connection failed. Please check:
    echo - Connection string is correct
    echo - MongoDB is running (for local)
    echo - Network access is allowed (for Atlas)
)
cd ..
goto end

:invalid
echo Invalid choice.
goto end

:end
echo.
pause


