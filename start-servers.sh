#!/bin/bash

echo "========================================"
echo "  Employee Attendance System"
echo "  Starting Backend and Frontend Servers"
echo "========================================"
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "ERROR: Node.js is not installed"
    echo "Please install Node.js from https://nodejs.org/"
    exit 1
fi

# Check if backend node_modules exists
if [ ! -d "backend/node_modules" ]; then
    echo "Installing backend dependencies..."
    cd backend
    npm install
    cd ..
fi

# Check if frontend node_modules exists
if [ ! -d "frontend/node_modules" ]; then
    echo "Installing frontend dependencies..."
    cd frontend
    npm install
    cd ..
fi

# Check if .env files exist
if [ ! -f "backend/.env" ]; then
    echo "WARNING: backend/.env file not found!"
    echo "Please create backend/.env file with:"
    echo "  MONGODB_URI=mongodb://localhost:27017/employee_attendance"
    echo "  PORT=5000"
    echo "  JWT_SECRET=your_super_secret_jwt_key_change_this_in_production"
    echo ""
fi

if [ ! -f "frontend/.env" ]; then
    echo "WARNING: frontend/.env file not found!"
    echo "Please create frontend/.env file with:"
    echo "  REACT_APP_API_URL=http://localhost:5000/api"
    echo ""
fi

echo "Starting Backend Server..."
cd backend
npm start &
BACKEND_PID=$!
cd ..

sleep 3

echo "Starting Frontend Server..."
cd frontend
npm start &
FRONTEND_PID=$!
cd ..

echo ""
echo "========================================"
echo "  Servers are starting..."
echo "  Backend: http://localhost:5000"
echo "  Frontend: http://localhost:3000"
echo "========================================"
echo ""
echo "Press Ctrl+C to stop all servers"

# Wait for user interrupt
trap "kill $BACKEND_PID $FRONTEND_PID 2>/dev/null; exit" INT
wait


