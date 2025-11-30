# 🚨 URGENT: Fix MongoDB Connection Now

## The Problem
Your application can't connect to MongoDB, so login and registration fail.

## ⚡ Quickest Solution (5 Minutes)

### Use MongoDB Atlas (Free Cloud Database)

**Step 1: Create Account (2 minutes)**
1. Visit: https://www.mongodb.com/cloud/atlas/register
2. Sign up with email
3. Verify email

**Step 2: Create Free Cluster (1 minute)**
1. Click "Build a Database"
2. Select **FREE** (M0) tier
3. Choose AWS as provider
4. Select region (choose closest to you)
5. Click "Create" (takes 1-3 minutes)

**Step 3: Create Database User (1 minute)**
1. Go to "Database Access" (left menu)
2. Click "Add New Database User"
3. Username: `attendance_user`
4. Password: Create a password (SAVE IT!)
5. Click "Add User"

**Step 4: Allow Network Access (30 seconds)**
1. Go to "Network Access" (left menu)
2. Click "Add IP Address"
3. Click "Allow Access from Anywhere" button
4. Click "Confirm"

**Step 5: Get Connection String (1 minute)**
1. Go to "Database" (left menu)
2. Click "Connect" on your cluster
3. Choose "Connect your application"
4. Copy the connection string
5. It looks like:
   ```
   mongodb+srv://attendance_user:<password>@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority
   ```

**Step 6: Update .env File**
1. Open `backend/.env`
2. Replace the MONGODB_URI line with:
   ```
   MONGODB_URI=mongodb+srv://attendance_user:YOUR_PASSWORD@cluster0.xxxxx.mongodb.net/employee_attendance?retryWrites=true&w=majority
   ```
3. Replace `YOUR_PASSWORD` with the password you created
4. Replace `cluster0.xxxxx.mongodb.net` with your actual cluster address
5. Make sure `/employee_attendance` is in the path

**Step 7: Restart Backend**
1. Stop the backend server (Ctrl+C in backend window)
2. Start it again: `npm run dev`
3. You should see: "✓ Connected to MongoDB successfully!"

**Step 8: Seed Database**
In backend window, run:
```powershell
npm run seed
```

**Step 9: Login**
Use these credentials:
- Manager: `alice.manager@example.com` / `manager123`
- Employee: `charlie.employee@example.com` / `employee123`

---

## ✅ That's It!

Your application will now work perfectly with MongoDB Atlas!

---

## Alternative: Local MongoDB

If you prefer local installation:

1. Download: https://www.mongodb.com/try/download/community
2. Install MongoDB Community Server
3. Start service:
   ```powershell
   net start MongoDB
   ```
4. Your current .env should work:
   ```
   MONGODB_URI=mongodb://localhost:27017/employee_attendance
   ```

---

**Need Help?** See MONGODB_SETUP.md for more details.



