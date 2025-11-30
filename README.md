# Employee Attendance System

## Overview
This is a full-stack Employee Attendance System with two user roles: Employee and Manager.

Employees can register, login, mark daily attendance (check-in/check-out), view attendance history with calendar view, and monthly summaries.

Managers can view and manage team attendance, generate reports, view dashboards with charts, and export attendance data to CSV.

## Features

### Employee Features
- ✅ Register/Login
- ✅ Mark attendance (Check In / Check Out)
- ✅ View attendance history (table and calendar view)
- ✅ View monthly summary (Present/Absent/Late days)
- ✅ Dashboard with stats (today's status, monthly summary, total hours, recent attendance)
- ✅ Profile page

### Manager Features
- ✅ Login
- ✅ View all employees attendance
- ✅ Filter by employee, date, status
- ✅ View team attendance summary
- ✅ Export attendance reports (CSV)
- ✅ Dashboard with team stats and charts
- ✅ Team calendar view
- ✅ Reports page with date range filtering

## Technology Stack
- **Frontend**: React, Redux Toolkit, React Router, Recharts
- **Backend**: Node.js, Express, MongoDB, Mongoose
- **Authentication**: JWT (JSON Web Tokens)
- **Password Hashing**: bcryptjs

## Prerequisites
- Node.js >= 16.x
- MongoDB (local or remote instance like MongoDB Atlas)
- npm (Node Package Manager)

## Installation and Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd Employee_Attendance_System_25_11_30_06_51_05
```

### 2. Backend Setup

1. Navigate to the backend folder:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the backend folder (copy from `.env.example`):
```bash
cp ../.env.example .env
```

4. Update the `.env` file with your MongoDB connection string:
```env
MONGODB_URI=mongodb://localhost:27017/employee_attendance
PORT=5000
JWT_SECRET=your_super_secret_jwt_key_change_this_in_production
```

5. Start the backend server:
```bash
# Development mode (with nodemon)
npm run dev

# Production mode
npm start
```

The backend server will run on `http://localhost:5000` (or the port specified in `.env`).

6. (Optional) Seed the database with sample data:
```bash
npm run seed
```

This will create:
- 2 managers (password: `manager123`)
- 3 employees (password: `employee123`)
- Sample attendance records for the past 5 days

### 3. Frontend Setup

1. Navigate to the frontend folder (in a new terminal):
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the frontend folder:
```env
REACT_APP_API_URL=http://localhost:5000/api
```

4. Start the frontend development server:
```bash
npm start
```

The frontend will run on `http://localhost:3000` (default React port).

## Environment Variables

### Backend (.env in backend folder)
- `MONGODB_URI`: MongoDB connection string
- `PORT`: Server port (default: 5000)
- `JWT_SECRET`: Secret key for JWT token signing

### Frontend (.env in frontend folder)
- `REACT_APP_API_URL`: Backend API URL (default: http://localhost:5000/api)

## API Endpoints

### Auth
- `POST /api/auth/register` - Register new employee
- `POST /api/auth/login` - Login user
- `GET /api/auth/me` - Get current user profile

### Attendance (Employee)
- `POST /api/attendance/checkin` - Check in
- `POST /api/attendance/checkout` - Check out
- `GET /api/attendance/my-history` - My attendance history
- `GET /api/attendance/my-summary` - Monthly summary
- `GET /api/attendance/today` - Today's status

### Attendance (Manager)
- `GET /api/attendance/all` - All employees attendance
- `GET /api/attendance/employee/:id` - Specific employee
- `GET /api/attendance/summary` - Team summary
- `GET /api/attendance/export` - Export CSV
- `GET /api/attendance/today-status` - Who's present today

### Dashboard
- `GET /api/dashboard/employee` - Employee stats
- `GET /api/dashboard/manager` - Manager stats

## Database Schema

### Users
- `id` - MongoDB ObjectId
- `name` - String
- `email` - String (unique)
- `password` - String (hashed)
- `role` - String (employee/manager)
- `employeeId` - String (unique, e.g., EMP001)
- `department` - String (optional)
- `createdAt` - Date

### Attendance
- `id` - MongoDB ObjectId
- `userId` - ObjectId (reference to User)
- `date` - Date
- `checkInTime` - Date
- `checkOutTime` - Date
- `status` - String (present/absent/late/half-day)
- `totalHours` - Number
- `createdAt` - Date

## Usage

### Employee Flow
1. Register as an employee at `/register`
2. Login at `/login`
3. View dashboard at `/employee/dashboard`
4. Mark attendance at `/employee/mark-attendance`
5. View attendance history (table or calendar) at `/employee/attendance-history`
6. View profile at `/employee/profile`

### Manager Flow
1. Login at `/login` (use manager credentials from seed data)
2. View dashboard at `/manager/dashboard` (with charts and stats)
3. View team attendance at `/manager/team-attendance` (with filters)
4. View team calendar at `/manager/team-calendar`
5. Generate reports at `/manager/reports` (with CSV export)

## Sample Login Credentials (after seeding)

### Managers
- Email: `alice.manager@example.com` | Password: `manager123`
- Email: `bob.manager@example.com` | Password: `manager123`

### Employees
- Email: `charlie.employee@example.com` | Password: `employee123`
- Email: `dana.employee@example.com` | Password: `employee123`
- Email: `eli.employee@example.com` | Password: `employee123`

## Project Structure

```
Employee_Attendance_System/
├── backend/
│   ├── index.js              # Express server entry point
│   ├── models/
│   │   ├── User.js           # User model
│   │   └── Attendance.js     # Attendance model
│   ├── routes/
│   │   ├── auth.js           # Authentication routes
│   │   ├── attendance.js     # Attendance routes
│   │   └── dashboard.js      # Dashboard routes
│   ├── middleware/
│   │   └── auth.js           # JWT authentication middleware
│   ├── seed.js               # Database seeding script
│   ├── package.json
│   └── .env                  # Environment variables
├── frontend/
│   ├── src/
│   │   ├── api/
│   │   │   └── axios.js      # Axios configuration
│   │   ├── components/
│   │   │   └── Header.js     # Navigation header
│   │   ├── pages/
│   │   │   ├── Login.js
│   │   │   ├── Register.js
│   │   │   ├── EmployeeDashboard.js
│   │   │   ├── ManagerDashboard.js
│   │   │   ├── MarkAttendance.js
│   │   │   ├── AttendanceHistory.js
│   │   │   ├── Profile.js
│   │   │   ├── TeamAttendance.js
│   │   │   ├── TeamCalendar.js
│   │   │   └── Reports.js
│   │   ├── redux/
│   │   │   ├── slices/
│   │   │   │   └── authSlice.js
│   │   │   └── store.js
│   │   ├── App.js
│   │   ├── index.js
│   │   └── index.css
│   ├── package.json
│   └── .env                  # Environment variables
├── .env.example              # Example environment variables
└── README.md
```

## Screenshots

### Employee Dashboard
- Today's attendance status
- Monthly summary (Present/Absent/Late/Half-Day)
- Total hours worked this month
- Recent attendance (last 7 days)

### Manager Dashboard
- Total employees count
- Today's attendance stats
- Weekly attendance trend chart
- Department-wise attendance pie chart

### Attendance History
- Table view with pagination
- Calendar view with color coding:
  - Green: Present
  - Red: Absent
  - Yellow: Late
  - Orange: Half-Day

### Reports
- Date range filtering
- Employee filtering
- CSV export functionality

## Development

### Running in Development Mode

**Backend:**
```bash
cd backend
npm run dev
```

**Frontend:**
```bash
cd frontend
npm start
```

### Building for Production

**Frontend:**
```bash
cd frontend
npm run build
```

The production build will be in the `frontend/build` folder.

## Troubleshooting

1. **MongoDB Connection Error**: Ensure MongoDB is running and the connection string in `.env` is correct.

2. **Port Already in Use**: Change the `PORT` in backend `.env` file.

3. **CORS Errors**: Ensure the backend CORS is configured correctly and frontend `.env` has the correct `REACT_APP_API_URL`.

4. **JWT Token Errors**: Ensure `JWT_SECRET` is set in backend `.env`.

## License
MIT

## Author
Employee Attendance System
