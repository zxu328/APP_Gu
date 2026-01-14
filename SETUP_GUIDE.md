# Complete Setup Guide for Shopping App

This guide will walk you through setting up all the necessary accounts and platforms to build and deploy your iOS shopping app.

## Table of Contents

1. [Apple Developer Account Setup](#apple-developer-account-setup)
2. [Xcode Installation and Configuration](#xcode-installation-and-configuration)
3. [Project Setup](#project-setup)
4. [Payment Service Setup](#payment-service-setup)
5. [Building and Testing](#building-and-testing)
6. [App Store Submission (Future)](#app-store-submission-future)

---

## Apple Developer Account Setup

### Step 1: Create or Use Existing Apple ID

**If you already have an Apple ID:**
- Skip to Step 2

**If you need to create an Apple ID:**

1. Go to [appleid.apple.com](https://appleid.apple.com)
2. Click **"Create Your Apple ID"**
3. Fill in the required information:
   - First Name
   - Last Name
   - Email Address (use a professional email)
   - Password (must be at least 8 characters with uppercase, lowercase, and numbers)
   - Security Questions
   - Phone Number
4. Verify your email address
5. Complete two-factor authentication setup

**Important:** Use an email address you'll have long-term access to, as this will be tied to your developer account.

### Step 2: Choose Your Developer Account Type

You have two options:

#### Option A: Free Apple Developer Account (For Development Only)

**Best for:** Learning, testing on your own devices, development

**Limitations:**
- Can only install apps on your own devices
- Apps expire after 7 days (need to reinstall)
- Cannot publish to App Store
- Limited to 3 apps at a time

**How to set up:**
1. Open Xcode (download from Mac App Store if needed)
2. Go to **Xcode → Settings → Accounts** (or **Preferences → Accounts**)
3. Click the **"+"** button
4. Select **"Apple ID"**
5. Sign in with your Apple ID
6. Your account will appear in the list

**Cost:** FREE

#### Option B: Paid Apple Developer Program ($99/year)

**Best for:** Publishing to App Store, distributing to others, full features

**Benefits:**
- Publish apps to App Store
- Distribute apps to testers via TestFlight
- Apps don't expire
- Access to advanced features (Apple Pay, Push Notifications, etc.)
- No limit on number of apps

**How to enroll:**

1. Go to [developer.apple.com/programs](https://developer.apple.com/programs)
2. Click **"Enroll"**
3. Sign in with your Apple ID
4. Choose enrollment type:
   - **Individual:** $99/year (requires personal information)
   - **Organization:** $99/year (requires D-U-N-S number and business info)
5. Complete the enrollment:
   - Provide personal/business information
   - Agree to the license agreement
   - Enter payment information ($99 USD/year)
   - Wait for approval (usually 24-48 hours)

**Required for enrollment:**
- Valid Apple ID
- Credit card for payment
- For organizations: D-U-N-S number (get from [dunsnumber.com](https://www.dnb.com/duns-number.html))

**Recommendation:** Start with the free account to test, then upgrade when ready to publish.

---

## Xcode Installation and Configuration

### Step 1: Install Xcode

1. Open the **Mac App Store**
2. Search for **"Xcode"**
3. Click **"Get"** or **"Install"**
4. Wait for download (Xcode is large, ~15GB)
5. Once installed, open Xcode
6. Accept the license agreement
7. Install additional components when prompted

**System Requirements:**
- macOS 13.0 (Ventura) or later
- At least 15GB free disk space
- 8GB RAM minimum (16GB recommended)

### Step 2: Install Command Line Tools

1. Open **Terminal** (Applications → Utilities → Terminal)
2. Run: `xcode-select --install`
3. Follow the installation prompts

### Step 3: Configure Xcode for Development

1. Open Xcode
2. Go to **Xcode → Settings** (or **Preferences**)
3. Click **"Accounts"** tab
4. Add your Apple ID (if not already added):
   - Click **"+"** button
   - Select **"Apple ID"**
   - Sign in
5. Select your account and click **"Download Manual Profiles"** (if needed)

---

## Project Setup

### Step 1: Open the Project

1. Navigate to your project folder:
   ```bash
   cd /Users/zhaoyixu/Documents/applications
   ```

2. Open the project in Xcode:
   ```bash
   open ShoppingApp.xcodeproj
   ```
   
   Or double-click `ShoppingApp.xcodeproj` in Finder

### Step 2: Configure Signing & Capabilities

1. In Xcode, select the **ShoppingApp** project in the navigator (top-left)
2. Select the **ShoppingApp** target
3. Click the **"Signing & Capabilities"** tab
4. Under **"Team"**, select your Apple ID/Team
5. Xcode will automatically:
   - Create a Bundle Identifier (you may need to change it if it's taken)
   - Generate a provisioning profile
   - Set up code signing

**If you see errors:**
- Change the Bundle Identifier to something unique (e.g., `com.yourname.ShoppingApp`)
- Make sure your Apple ID is added in Xcode Settings

### Step 3: Select a Simulator or Device

1. At the top of Xcode, next to the Play button, click the device selector
2. Choose:
   - **iOS Simulator** (iPhone 15, iPhone 14, etc.) - for testing without a device
   - **Your iPhone/iPad** - if connected via USB (requires trust on device)

### Step 4: Build and Run

1. Press **⌘ + R** (Command + R) or click the **Play** button
2. Wait for the build to complete
3. The app will launch in the simulator or on your device

**First build may take a few minutes** as Xcode compiles everything.

---

## Payment Service Setup

Your app includes payment functionality. Here's how to set up each option:

### Option 1: Stripe (Recommended for Credit Cards)

**Step 1: Create Stripe Account**

1. Go to [stripe.com](https://stripe.com)
2. Click **"Start now"** or **"Sign up"**
3. Create an account with:
   - Email address
   - Password
   - Business information
4. Verify your email

**Step 2: Get API Keys**

1. Log into Stripe Dashboard
2. Go to **Developers → API keys**
3. You'll see:
   - **Publishable key** (starts with `pk_test_` for testing)
   - **Secret key** (starts with `sk_test_` for testing) - **KEEP THIS SECRET!**

**Step 3: Integration (Requires Backend)**

⚠️ **Important:** Never put secret keys in your iOS app. You need a backend server.

**For now (testing):**
- The app has a UI for credit card entry
- You'll need to implement Stripe SDK later
- See Stripe iOS SDK: [stripe.dev/docs/stripe-ios](https://stripe.dev/docs/stripe-ios)

**For production:**
- Set up a backend server (Node.js, Python, etc.)
- Process payments server-side
- Use Stripe's webhook system for order confirmations

### Option 2: Apple Pay

**Requirements:**
- Apple Developer Program membership ($99/year)
- Merchant ID from Apple Developer portal

**Step 1: Create Merchant ID**

1. Go to [developer.apple.com/account](https://developer.apple.com/account)
2. Sign in with your Apple Developer account
3. Go to **Certificates, Identifiers & Profiles**
4. Click **"Identifiers"**
5. Click **"+"** button
6. Select **"Merchant IDs"**
7. Enter a description and identifier (e.g., `merchant.com.yourname.shoppingapp`)
8. Click **"Continue"** and **"Register"**

**Step 2: Configure in Xcode**

1. In Xcode, select your project
2. Go to **Signing & Capabilities**
3. Click **"+ Capability"**
4. Add **"Apple Pay"**
5. Select your Merchant ID from the dropdown

**Step 3: Implement Apple Pay**

- The app UI is ready for Apple Pay
- You'll need to implement `PKPaymentAuthorizationController`
- See Apple's documentation: [developer.apple.com/apple-pay](https://developer.apple.com/apple-pay)

### Option 3: PayPal

1. Go to [paypal.com/business](https://www.paypal.com/business)
2. Create a business account
3. Get your Client ID and Secret
4. Integrate PayPal SDK (requires additional setup)

**Note:** Current implementation shows PayPal as an option, but full integration requires PayPal SDK setup.

---

## Building and Testing

### Testing on Simulator

1. Select an iOS Simulator from the device menu
2. Press **⌘ + R** to build and run
3. The simulator will launch and show your app

**Simulator Tips:**
- Use **⌘ + Shift + H** to go home
- Use **⌘ + K** to show/hide keyboard
- Rotate device: **⌘ + ←** or **⌘ + →**

### Testing on Your iPhone/iPad

**Step 1: Connect Your Device**

1. Connect your iPhone/iPad to your Mac via USB
2. Unlock your device
3. If prompted, tap **"Trust This Computer"** on your device
4. Enter your device passcode

**Step 2: Enable Developer Mode (iOS 16+)**

1. On your device, go to **Settings → Privacy & Security**
2. Scroll down to **Developer Mode**
3. Toggle it **ON**
4. Restart your device
5. Confirm when prompted

**Step 3: Build to Device**

1. In Xcode, select your device from the device menu
2. Press **⌘ + R** to build and run
3. On your device, if prompted:
   - Go to **Settings → General → VPN & Device Management**
   - Tap your developer account
   - Tap **"Trust [Your Name]"**
   - Tap **"Trust"** again

**Note:** With a free account, apps expire after 7 days. You'll need to rebuild and reinstall.

---

## App Store Submission (Future)

When you're ready to publish:

### Step 1: Prepare Your App

1. **App Icon:**
   - Create 1024x1024 PNG icon
   - Add to Assets.xcassets → AppIcon

2. **Screenshots:**
   - Take screenshots on different device sizes
   - Required: iPhone 6.7", iPhone 6.5", iPad Pro 12.9"

3. **App Information:**
   - App name
   - Description
   - Keywords
   - Privacy policy URL
   - Support URL

### Step 2: Archive and Upload

1. In Xcode, select **"Any iOS Device"** as target
2. Go to **Product → Archive**
3. Wait for archive to complete
4. In Organizer window:
   - Click **"Distribute App"**
   - Choose **"App Store Connect"**
   - Follow the wizard

### Step 3: App Store Connect

1. Go to [appstoreconnect.apple.com](https://appstoreconnect.apple.com)
2. Create a new app
3. Fill in all required information
4. Submit for review

**Review Process:**
- Usually takes 24-48 hours
- Apple will test your app
- You'll receive email notifications

---

## Troubleshooting

### "No signing certificate found"

**Solution:**
1. Go to Xcode → Settings → Accounts
2. Select your account
3. Click "Download Manual Profiles"
4. Try building again

### "Bundle identifier is already in use"

**Solution:**
1. In Xcode, select your target
2. Go to General tab
3. Change Bundle Identifier to something unique
4. Use reverse domain notation: `com.yourname.shoppingapp`

### "Failed to register bundle identifier"

**Solution:**
- Make sure you're signed in with a valid Apple ID
- Try changing the bundle identifier
- For paid accounts, this shouldn't happen

### App crashes on launch

**Solution:**
1. Check Xcode console for error messages
2. Make sure all files are included in the target
3. Clean build folder: **Product → Clean Build Folder** (⌘ + Shift + K)

### Can't install on device

**Solution:**
1. Make sure device is trusted
2. Check Developer Mode is enabled (iOS 16+)
3. Trust the developer certificate in Settings
4. Rebuild and reinstall

---

## Next Steps

1. ✅ Set up Apple Developer account
2. ✅ Install and configure Xcode
3. ✅ Build and test the app
4. ⏭️ Set up backend server (for real authentication and payments)
5. ⏭️ Integrate payment SDKs (Stripe, Apple Pay)
6. ⏭️ Add real product data
7. ⏭️ Test thoroughly
8. ⏭️ Prepare for App Store submission

---

## Resources

- **Apple Developer Documentation:** [developer.apple.com/documentation](https://developer.apple.com/documentation)
- **SwiftUI Tutorials:** [developer.apple.com/tutorials/swiftui](https://developer.apple.com/tutorials/swiftui)
- **Human Interface Guidelines:** [developer.apple.com/design/human-interface-guidelines](https://developer.apple.com/design/human-interface-guidelines)
- **Stripe iOS SDK:** [stripe.dev/docs/stripe-ios](https://stripe.dev/docs/stripe-ios)
- **Apple Pay Guide:** [developer.apple.com/apple-pay](https://developer.apple.com/apple-pay)

---

## Support

If you encounter issues:

1. Check Xcode console for error messages
2. Search [Apple Developer Forums](https://developer.apple.com/forums)
3. Check [Stack Overflow](https://stackoverflow.com) for Swift/SwiftUI questions
4. Review Apple's documentation

Good luck with your app development! 🚀
