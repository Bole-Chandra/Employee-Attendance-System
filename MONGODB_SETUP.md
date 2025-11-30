# MongoDB Setup Guide

## Quick Setup Options

### Option 1: MongoDB Atlas (Cloud - RECOMMENDED) ⭐

**Why Atlas?** Free, no installation needed, works immediately!

1. **Sign Up for Free:**
   - Go to: https://www.mongodb.com/cloud/atlas/register
   - Create a free account (no credit card required)

2. **Create a Cluster:**
   - Click "Build a Database"
   - Choose "FREE" (M0) tier
   - Select a cloud provider and region (closest to you)
   - Click "Create"

3. **Create Database User:**
   - Go to "Database Access" in left menu
   - Click "Add New Database User"
   - Choose "Password" authentication
   - Username: `attendance_user` (or any username)
   - Password: Generate a secure password (save it!)
   - Database User Privileges: "Atlas admin" or "Read and write to any database"
   - Click "Add User"

4. **Configure Network Access:**
   - Go to "Network Access" in left menu
   - Click "Add IP Address"
   - Click "Allow Access from Anywhere" (for development)
   - OR add your specific IP address
   - Click "Confirm"

5. **Get Connection String:**
   - Go to "Database" in left menu
   - Click "Connect" on your cluster
   - Choose "Connect your application"
   - Select "Node.js" and version "5.5 or later"
   - Copy the connection string
   - It looks like: `mongodb+srv://<username>:<password>@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority`

6. **Update .env File:**
   - Open `backend/.env`
   - Replace the connection string:
   ```
   MONGODB_URI=mongodb+srv://attendance_user:YOUR_PASSWORD@cluster0.xxxxx.mongodb.net/employee_attendance?retryWrites=true&w=majority
   ```
   - Replace `YOUR_PASSWORD` with the password you created
   - Replace `cluster0.xxxxx` with your actual cluster address
   - Add `/employee_attendance` before the `?` to specify database name

7. **Test Connection:**
   - Restart your backend server
   - You should see: "✓ Connected to MongoDB successfully!"

### Option 2: Local MongoDB Installation

1. **Download MongoDB:**
   - Go to: https://www.mongodb.com/try/download/community
   - Select: Windows, MSI package
   - Download and install

2. **Start MongoDB Service:**
   - MongoDB should start automatically as a Windows service
   - If not, open Services (services.msc) and start "MongoDB" service

3. **Verify Installation:**
   - Open Command Prompt
   - Run: `mongod --version`
   - Should show MongoDB version

4. **Update .env File:**
   - Open `backend/.env`
   - Use: `MONGODB_URI=mongodb://localhost:27017/employee_attendance`

5. **Test Connection:**
   - Restart your backend server
   - You should see: "✓ Connected to MongoDB successfully!"

## Troubleshooting

### Connection Timeout
- **Atlas:** Check Network Access settings (allow your IP)
- **Local:** Check if MongoDB service is running
- **Both:** Verify connection string in `.env` file

### Authentication Failed
- **Atlas:** Check username and password in connection string
- **Local:** Usually no authentication needed for local setup

### Connection String Format
- **Atlas:** `mongodb+srv://username:password@cluster.mongodb.net/database`
- **Local:** `mongodb://localhost:27017/database`

### Still Having Issues?
1. Check MongoDB connection string in `backend/.env`
2. Ensure no typos in username/password
3. For Atlas: Verify IP is whitelisted
4. Restart backend server after changing `.env`

## Need Help?

- MongoDB Atlas Docs: https://docs.atlas.mongodb.com/
- MongoDB Community Docs: https://docs.mongodb.com/manual/
