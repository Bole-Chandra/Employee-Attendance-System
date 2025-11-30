@echo off
echo ========================================
echo   MONGODB CONNECTION FIX
echo ========================================
echo.
echo The application needs MongoDB to work.
echo.
echo OPTION 1: MongoDB Atlas (Free Cloud - Recommended)
echo ----------------------------------------
echo 1. Go to: https://www.mongodb.com/cloud/atlas/register
echo 2. Create free account
echo 3. Create free cluster (M0 tier)
echo 4. Create database user
echo 5. Whitelist IP (Allow from anywhere: 0.0.0.0/0)
echo 6. Get connection string
echo 7. Update backend/.env with connection string
echo.
echo OPTION 2: Install MongoDB Locally
echo ----------------------------------------
echo 1. Download: https://www.mongodb.com/try/download/community
echo 2. Install MongoDB Community Server
echo 3. Start service: net start MongoDB
echo.
echo See MONGODB_SETUP.md for detailed instructions
echo.
pause



