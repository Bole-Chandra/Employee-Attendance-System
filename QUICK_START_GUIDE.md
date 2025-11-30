# Quick Start Guide - Employee Attendance System

## ✅ Application Status

The application has been set up and is ready to run! Both backend and frontend servers should be starting in separate PowerShell windows.

## 🚀 Running the Application

### Option 1: Use the Start Script (Recommended)
Double-click `start-servers.bat` to start both servers automatically.

### Option 2: Manual Start

**Backend Server:**
```bash
cd backend
npm start
```
Backend runs on: http://localhost:5000

**Frontend Server:**
```bash
cd frontend
npm start
```
Frontend runs on: http://localhost:3000 (will open automatically in browser)

## 📋 Prerequisites Check

✅ Node.js installed
✅ Backend dependencies installed
✅ Frontend dependencies installed
✅ Environment files created (.env)

## 🗄️ Database Setup

### MongoDB Required!

The application requires MongoDB to be running. Choose one:

**Option A: MongoDB Atlas (Cloud - Recommended)**
1. Go to https://www.mongodb.com/cloud/atlas/register
2. Create a free account and cluster
3. Get your connection string
4. Update `backend/.env`:
   ```
   MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/employee_attendance
   ```

**Option B: Local MongoDB**
1. Download from https://www.mongodb.com/try/download/community
2. Install and start MongoDB service
3. Default connection: `mongodb://localhost:27017/employee_attendance`

## 🌱 Seed Database (Optional)

To populate with sample data:
```bash
cd backend
npm run seed
```

This creates:
- 2 Managers (password: `manager123`)
- 3 Employees (password: `employee123`)
- Sample attendance records

## 🔑 Test Credentials (After Seeding)

### Managers:
- Email: `alice.manager@example.com` | Password: `manager123`
- Email: `bob.manager@example.com` | Password: `manager123`

### Employees:
- Email: `charlie.employee@example.com` | Password: `employee123`
- Email: `dana.employee@example.com` | Password: `employee123`
- Email: `eli.employee@example.com` | Password: `employee123`

## 📱 Features

### Employee Features:
- ✅ Register/Login
- ✅ Mark Attendance (Check In/Out)
- ✅ View Attendance History (Table & Calendar)
- ✅ Monthly Summary Dashboard
- ✅ Profile Management

### Manager Features:
- ✅ Login
- ✅ Team Attendance View
- ✅ Team Calendar View
- ✅ Attendance Reports with CSV Export
- ✅ Dashboard with Charts & Statistics

## 🎨 Responsive Design

The application is fully responsive and works on:
- ✅ Desktop (1920px+)
- ✅ Laptop (1024px - 1920px)
- ✅ Tablet (768px - 1024px)
- ✅ Mobile (320px - 768px)

## 🐛 Troubleshooting

### Backend won't start:
- Check if MongoDB is running
- Verify `backend/.env` file exists
- Check if port 5000 is available

### Frontend won't start:
- Check if port 3000 is available
- Verify `frontend/.env` file exists
- Try deleting `node_modules` and running `npm install` again

### MongoDB Connection Error:
- Verify MongoDB is running
- Check connection string in `backend/.env`
- For Atlas: Ensure IP whitelist includes your IP

### CORS Errors:
- Ensure backend is running on port 5000
- Check `REACT_APP_API_URL` in `frontend/.env`

## 📞 Support

If you encounter any issues:
1. Check the console/terminal for error messages
2. Verify all environment variables are set correctly
3. Ensure MongoDB is running and accessible
4. Check that both servers are running

## 🎉 You're All Set!

The application should now be running. Open http://localhost:3000 in your browser to get started!


