#!/bin/bash

# Fix Xcode Command Line Tools (run this first if you see xcrun errors)
# sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
# OR if Xcode is not installed:
# xcode-select --install

# Navigate to project directory
cd /Users/zhaoyixu/Documents/applications

# Initialize git repository (if not already initialized)
git init

# Add remote repository
git remote add origin git@github.com:zxu328/APP_Gu.git 2>/dev/null || git remote set-url origin git@github.com:zxu328/APP_Gu.git

# Add all files
git add .

# Commit changes
git commit -m "Initial commit: iOS Shopping App with product catalog, user auth, cart, checkout, payment, and order tracking"

# Set main branch
git branch -M main

# Push to GitHub
git push -u origin main

echo "Done! If you see authentication errors, make sure:"
echo "1. You have SSH keys set up for GitHub"
echo "2. The repository exists on GitHub"
echo "3. You have push access to the repository"
