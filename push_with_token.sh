#!/bin/bash

# Script to push to GitHub using Personal Access Token
# GitHub no longer accepts passwords - you need a Personal Access Token

echo "GitHub Push Script"
echo "=================="
echo ""
echo "GitHub requires a Personal Access Token instead of a password."
echo ""

# Prompt for token
read -sp "Enter your GitHub Personal Access Token: " TOKEN
echo ""

if [ -z "$TOKEN" ]; then
    echo "Error: Token is required"
    echo ""
    echo "To create a token:"
    echo "1. Go to: https://github.com/settings/tokens"
    echo "2. Click 'Generate new token' → 'Generate new token (classic)'"
    echo "3. Name it (e.g., 'Shopping App Push')"
    echo "4. Select scope: 'repo' (full control)"
    echo "5. Click 'Generate token'"
    echo "6. Copy the token and run this script again"
    exit 1
fi

cd /Users/zhaoyixu/Documents/applications

# Set remote with token
git remote set-url origin https://zxu328:${TOKEN}@github.com/zxu328/APP_Gu.git

# Push
echo "Pushing to GitHub..."
git push -u origin main

# Remove token from remote URL for security
git remote set-url origin https://github.com/zxu328/APP_Gu.git

echo ""
echo "Done! Check your repository at: https://github.com/zxu328/APP_Gu"
