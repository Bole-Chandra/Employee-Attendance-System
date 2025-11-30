# Setup Instructions to Run the App

## ⚠️ Important: Before Running

### 1. Create Environment Files

**Backend (.env file in `backend` folder):**
Create a file named `.env` in the `backend` folder with:
```
MONGODB_URI=mongodb://localhost:27017/employee_attendance
PORT=5000
JWT_SECRET=your_super_secret_jwt_key_change_this_in_production_12345
```

**Frontend (.env file in `frontend` folder):**
Create a file named `.env` in the `frontend` folder with:
```
REACT_APP_API_URL=http://localhost:5000/api
```

### 2. Ensure MongoDB is Running

- If using local MongoDB: Make sure MongoDB service is running
- If using MongoDB Atlas: Update the `MONGODB_URI` in backend `.env` with your connection string

### 3. Install Dependencies

**Backend:**
```powershell
cd backend
npm install
```

**Frontend:**
```powershell
cd frontend
npm install
```

### 4. Seed Database (Optional but Recommended)

```powershell
cd backend
npm run seed
```

This creates sample users:
- Managers: alice.manager@example.com / bob.manager@example.com (password: manager123)
- Employees: charlie.employee@example.com / dana.employee@example.com / eli.employee@example.com (password: employee123)

### 5. Start Servers

**Terminal 1 - Backend:**
```powershell
cd backend
npm run dev
```
Backend will run on http://localhost:5000

**Terminal 2 - Frontend:**
```powershell
cd frontend
npm start
```
Frontend will run on http://localhost:3000 and open automatically in your browser

## Quick Commands (PowerShell)

If you're in the project root:

```powershell
# Install all dependencies
cd backend; npm install; cd ..\frontend; npm install; cd ..

# Start backend (in one terminal)
cd backend; npm run dev

# Start frontend (in another terminal)
cd frontend; npm start
```

## Troubleshooting

### MongoDB Connection Error
- Ensure MongoDB is installed and running
- Check the connection string in `backend/.env`
- For Windows: MongoDB might be running as a service

### Port Already in Use
- Backend: Change `PORT=5000` to another port in `backend/.env`
- Frontend: Use `PORT=3001 npm start` to use a different port

### Module Not Found
- Run `npm install` in both backend and frontend folders

### CORS Errors
- Ensure backend is running before starting frontend
- Check `REACT_APP_API_URL` in `frontend/.env` matches backend URL

## Access the Application

Once both servers are running:
- Frontend: http://localhost:3000
- Backend API: http://localhost:5000/api

## Test Credentials (after seeding)

**Manager:**
- Email: `alice.manager@example.com`
- Password: `manager123`

**Employee:**
- Email: `charlie.employee@example.com`
- Password: `employee123`



