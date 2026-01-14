# Create GitHub Personal Access Token

GitHub no longer accepts passwords for Git operations. You need to create a Personal Access Token.

## Quick Steps:

1. **Go to GitHub Token Settings:**
   - Visit: https://github.com/settings/tokens
   - Or: GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)

2. **Generate New Token:**
   - Click **"Generate new token"** → **"Generate new token (classic)"**

3. **Configure Token:**
   - **Note:** Give it a name like "Shopping App Push"
   - **Expiration:** Choose your preference (90 days, 1 year, or no expiration)
   - **Select scopes:** Check **`repo`** (Full control of private repositories)
     - This gives full access to repositories

4. **Generate and Copy:**
   - Click **"Generate token"** at the bottom
   - **IMPORTANT:** Copy the token immediately - you won't be able to see it again!
   - It will look like: `ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

5. **Use the Token:**
   - Run the push script: `./push_with_token.sh`
   - When prompted, paste your token
   - Or use it directly in git commands

## Alternative: Use the Token Directly

Once you have your token, you can push directly:

```bash
cd /Users/zhaoyixu/Documents/applications

# Replace YOUR_TOKEN with your actual token
git remote set-url origin https://zxu328:YOUR_TOKEN@github.com/zxu328/APP_Gu.git
git push -u origin main

# Remove token from URL for security
git remote set-url origin https://github.com/zxu328/APP_Gu.git
```

## Security Note

- Never commit tokens to your repository
- Tokens are like passwords - keep them secret
- You can revoke tokens at any time from the same settings page
