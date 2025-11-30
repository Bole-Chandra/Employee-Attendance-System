@echo off
echo ========================================
echo   EMPLOYEE ATTENDANCE SYSTEM
echo ========================================
echo.
echo Starting Backend Server...
start "Backend Server" cmd /k "cd backend && npm run dev"
timeout /t 4 /nobreak >nul

echo Starting Frontend Server...
start "Frontend Server" cmd /k "cd frontend && npm start"
timeout /t 3 /nobreak >nul

echo.
echo ========================================
echo   SERVERS STARTED
echo ========================================
echo.
echo Backend:  http://localhost:5000
echo Frontend: http://localhost:3000
echo.
echo IMPORTANT: MongoDB Connection Required
echo.
echo To fix MongoDB connection:
echo   1. Use MongoDB Atlas (Free): https://www.mongodb.com/cloud/atlas/register
echo   2. Get connection string
echo   3. Update backend/.env with connection string
echo   4. Restart backend server
echo   5. Run: npm run seed (in backend window)
echo.
echo See FIX_MONGODB_NOW.md for detailed instructions
echo.
timeout /t 5 /nobreak >nul
start http://localhost:3000
pause



