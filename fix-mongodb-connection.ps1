Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  MongoDB Connection Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$envPath = Join-Path (Get-Location) "backend\.env"

Write-Host "Choose your MongoDB setup:" -ForegroundColor Yellow
Write-Host "1. MongoDB Atlas (Cloud - Recommended)" -ForegroundColor Green
Write-Host "2. Local MongoDB" -ForegroundColor Yellow
Write-Host "3. Exit" -ForegroundColor Red
Write-Host ""

$choice = Read-Host "Enter choice (1-3)"

if ($choice -eq "1") {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "  MongoDB Atlas Setup" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "If you don't have MongoDB Atlas account:" -ForegroundColor Yellow
    Write-Host "1. Go to: https://www.mongodb.com/cloud/atlas/register"
    Write-Host "2. Create free account"
    Write-Host "3. Create free cluster (M0)"
    Write-Host "4. Create database user (Database Access)"
    Write-Host "5. Allow network access (Network Access - Add IP or Allow from anywhere)"
    Write-Host "6. Get connection string (Database - Connect - Connect your application)"
    Write-Host ""
    Write-Host "Connection string format:" -ForegroundColor Yellow
    Write-Host "mongodb+srv://username:password@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority"
    Write-Host ""
    
    $connString = Read-Host "Paste your MongoDB Atlas connection string"
    
    if ([string]::IsNullOrWhiteSpace($connString)) {
        Write-Host "No connection string provided." -ForegroundColor Red
        exit 1
    }
    
    # Add database name if not present
    if ($connString -notmatch "employee_attendance") {
        $connString = $connString -replace "\?", "/employee_attendance?"
    }
    
    $mongoUri = $connString
}
elseif ($choice -eq "2") {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "  Local MongoDB Setup" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Make sure MongoDB is installed and running:" -ForegroundColor Yellow
    Write-Host "Download: https://www.mongodb.com/try/download/community"
    Write-Host ""
    $mongoUri = "mongodb://localhost:27017/employee_attendance"
    Write-Host "Using: $mongoUri" -ForegroundColor Green
    Write-Host ""
}
else {
    Write-Host "Exiting..." -ForegroundColor Yellow
    exit 0
}

Write-Host "Creating backend/.env file..." -ForegroundColor Yellow

$envContent = @"
MONGODB_URI=$mongoUri
PORT=5000
JWT_SECRET=your_super_secret_jwt_key_change_this_in_production_please_change_in_production
"@

$envContent | Out-File -FilePath $envPath -Encoding utf8

Write-Host "✓ Created backend/.env" -ForegroundColor Green
Write-Host ""
Write-Host "Testing connection..." -ForegroundColor Yellow

Push-Location backend
try {
    node test-mongodb.js
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "✅ Connection successful!" -ForegroundColor Green
        Write-Host ""
        $seedChoice = Read-Host "Do you want to seed the database now? (y/n)"
        if ($seedChoice -eq "y" -or $seedChoice -eq "Y") {
            Write-Host ""
            Write-Host "Seeding database..." -ForegroundColor Yellow
            npm run seed
        }
    }
    else {
        Write-Host ""
        Write-Host "❌ Connection failed. Please check:" -ForegroundColor Red
        Write-Host "- Connection string is correct"
        Write-Host "- MongoDB is running (for local)"
        Write-Host "- Network access is allowed (for Atlas)"
    }
}
catch {
    Write-Host "Error: $_" -ForegroundColor Red
}
finally {
    Pop-Location
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")


