@echo off
echo ========================================
echo   MongoDB Atlas Quick Setup Helper
echo ========================================
echo.
echo This will help you set up MongoDB Atlas connection.
echo.
echo Steps:
echo 1. Go to: https://www.mongodb.com/cloud/atlas/register
echo 2. Create a free account
echo 3. Create a free cluster (M0)
echo 4. Create database user (Database Access)
echo 5. Allow network access (Network Access - Add IP)
echo 6. Get connection string (Database - Connect - Connect your application)
echo.
echo.
set /p CONNECTION_STRING="Paste your MongoDB Atlas connection string here: "

if "%CONNECTION_STRING%"=="" (
    echo No connection string provided. Exiting.
    pause
    exit /b 1
)

REM Add database name if not present
echo %CONNECTION_STRING% | findstr /C:"employee_attendance" >nul
if errorlevel 1 (
    REM Replace ? with /employee_attendance?
    set CONNECTION_STRING=%CONNECTION_STRING:?=/employee_attendance?%
)

echo.
echo Creating backend/.env file...
(
echo MONGODB_URI=%CONNECTION_STRING%
echo PORT=5000
echo JWT_SECRET=your_super_secret_jwt_key_change_this_in_production
) > backend\.env

echo.
echo ✅ Connection string saved to backend/.env
echo.
echo Testing connection...
cd backend
node test-mongodb.js
cd ..

echo.
echo If connection test passed, you can now:
echo 1. Start the backend server
echo 2. Run: npm run seed (in backend folder)
echo.
pause


