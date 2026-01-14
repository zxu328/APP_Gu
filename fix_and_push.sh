#!/bin/bash

echo "Step 1: Fixing Xcode Command Line Tools..."
echo "This will require your password."

# Try to fix xcode-select path
if [ -d "/Applications/Xcode.app" ]; then
    sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
elif [ -d "/Library/Developer/CommandLineTools" ]; then
    # Try to reinstall command line tools
    echo "Xcode not found. Attempting to fix Command Line Tools..."
    sudo xcode-select --reset
else
    echo "Installing Command Line Tools..."
    xcode-select --install
    echo "Please wait for installation to complete, then run this script again."
    exit 1
fi

echo ""
echo "Step 2: Setting up git repository..."

cd /Users/zhaoyixu/Documents/applications

# Initialize git if needed
if [ ! -d ".git" ]; then
    git init
fi

# Add remote
git remote add origin git@github.com:zxu328/APP_Gu.git 2>/dev/null || git remote set-url origin git@github.com:zxu328/APP_Gu.git

# Add all files
git add .

# Commit
git commit -m "Initial commit: iOS Shopping App with product catalog, user auth, cart, checkout, payment, and order tracking" 2>/dev/null || echo "Note: Some files may already be committed"

# Set main branch
git branch -M main

echo ""
echo "Step 3: Pushing to GitHub..."
git push -u origin main

echo ""
echo "Done!"
echo ""
echo "If you see authentication errors:"
echo "1. Make sure you have SSH keys set up: ssh-keygen -t ed25519 -C 'your_email@example.com'"
echo "2. Add your SSH key to GitHub: https://github.com/settings/keys"
echo "3. Or use HTTPS: git remote set-url origin https://github.com/zxu328/APP_Gu.git"
