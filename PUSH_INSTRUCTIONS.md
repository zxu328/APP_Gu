# Instructions to Push Code to GitHub

The xcrun error is blocking git commands. Here's how to fix it and push your code:

## Quick Fix (Recommended)

Run this command in Terminal (you'll be asked for your password):

```bash
cd /Users/zhaoyixu/Documents/applications
./fix_and_push.sh
```

This script will:
1. Fix the Xcode Command Line Tools issue (requires your password)
2. Initialize git repository
3. Add remote
4. Commit all files
5. Push to GitHub

## Manual Steps

If the script doesn't work, run these commands one by one:

### 1. Fix Xcode Command Line Tools

```bash
# If Xcode is installed:
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer

# OR if Xcode is not installed, reinstall Command Line Tools:
sudo xcode-select --reset

# OR install Command Line Tools:
xcode-select --install
```

### 2. Set Up Git Repository

```bash
cd /Users/zhaoyixu/Documents/applications

# Initialize repository
git init

# Add remote
git remote add origin git@github.com:zxu328/APP_Gu.git

# Add all files
git add .

# Commit
git commit -m "Initial commit: iOS Shopping App with product catalog, user auth, cart, checkout, payment, and order tracking"

# Set main branch
git branch -M main

# Push to GitHub
git push -u origin main
```

## If You Get Authentication Errors

### Option 1: Set up SSH Keys (Recommended)

```bash
# Generate SSH key (if you don't have one)
ssh-keygen -t ed25519 -C "your_email@example.com"

# Copy your public key
cat ~/.ssh/id_ed25519.pub

# Add it to GitHub:
# 1. Go to https://github.com/settings/keys
# 2. Click "New SSH key"
# 3. Paste your public key
```

### Option 2: Use HTTPS Instead

```bash
cd /Users/zhaoyixu/Documents/applications
git remote set-url origin https://github.com/zxu328/APP_Gu.git
git push -u origin main
```

You'll be prompted for your GitHub username and password (or personal access token).

## Verify the Push

After pushing, check your repository at:
https://github.com/zxu328/APP_Gu

All your files should be there!
