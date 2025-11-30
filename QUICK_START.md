# Quick Start Guide

## Prerequisites
- Node.js >= 16.x installed
- MongoDB running (local or remote)
- npm installed

## Setup Instructions

### 1. Backend Setup

```bash
# Navigate to backend folder
cd backend

# Install dependencies
npm install

# Create .env file (copy from .env.example in root)
# Add your MongoDB connection string:
# MONGODB_URI=mongodb://localhost:27017/employee_attendance
# PORT=5000
# JWT_SECRET=your_secret_key_here

# Start backend server
npm run dev

# (Optional) Seed database with sample data
npm run seed
```

Backend will run on `http://localhost:5000`

### 2. Frontend Setup

```bash
# Open a new terminal
# Navigate to frontend folder
cd frontend

# Install dependencies
npm install

# Create .env file
# Add: REACT_APP_API_URL=http://localhost:5000/api

# Start frontend server
npm start
```

Frontend will run on `http://localhost:3000`

## Testing the Application

### Sample Login Credentials (after seeding)

**Managers:**
- Email: `alice.manager@example.com`
- Password: `manager123`

- Email: `bob.manager@example.com`
- Password: `manager123`

**Employees:**
- Email: `charlie.employee@example.com`
- Password: `employee123`

- Email: `dana.employee@example.com`
- Password: `employee123`

- Email: `eli.employee@example.com`
- Password: `employee123`

## Features to Test

### As Employee:
1. Register a new account
2. Login
3. View Dashboard (shows today's status, monthly summary, total hours, recent attendance)
4. Mark Attendance (Check In/Check Out)
5. View Attendance History (switch between table and calendar view)
6. View Profile

### As Manager:
1. Login with manager credentials
2. View Dashboard (shows stats, charts, absent employees list)
3. View Team Attendance (with filters)
4. View Team Calendar
5. Generate Reports (with CSV export)

## Troubleshooting

### MongoDB Connection Error
- Ensure MongoDB is running
- Check connection string in backend `.env` file

### Port Already in Use
- Change PORT in backend `.env` file
- Or change React port: `PORT=3001 npm start`

### CORS Errors
- Ensure backend is running
- Check `REACT_APP_API_URL` in frontend `.env` matches backend URL

### Module Not Found
- Run `npm install` in both backend and frontend folders

## Project Structure

```
Employee_Attendance_System/
├── backend/
│   ├── index.js              # Express server
│   ├── models/               # MongoDB models
│   ├── routes/               # API routes
│   ├── middleware/           # Auth middleware
│   ├── seed.js              # Database seeding
│   └── package.json
├── frontend/
│   ├── src/
│   │   ├── pages/           # All page components
│   │   ├── components/      # Reusable components
│   │   ├── redux/           # Redux store and slices
│   │   └── api/             # API configuration
│   └── package.json
├── .env.example             # Environment variables template
├── README.md                # Full documentation
└── REQUIREMENTS_CHECKLIST.md # Requirements verification
```

## All Requirements Met ✅

See `REQUIREMENTS_CHECKLIST.md` for complete verification of all requirements.



