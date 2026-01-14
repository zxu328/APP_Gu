# Shopping App - iOS E-Commerce Application

A complete iOS shopping app built with SwiftUI featuring product catalog, user authentication, shopping cart, checkout, payment processing, and order tracking.

## Features

- 🛍️ **Product Catalog**: Browse and search products with category filtering
- 👤 **User Authentication**: Registration and login system
- 🛒 **Shopping Cart**: Add, remove, and manage items
- 💳 **Checkout & Payment**: Multiple payment methods (Credit Card, Apple Pay, PayPal)
- 📦 **Order Tracking**: View order history and track order status
- 👤 **User Profile**: Manage personal information and shipping address

## Prerequisites

Before you can build and run this app, you'll need:

1. **macOS** with Xcode 14.0 or later
2. **Apple Developer Account** (free or paid)
3. **iOS Device or Simulator** (iOS 17.0+)

## Setting Up Your Apple Developer Account

### Step 1: Create an Apple ID (if you don't have one)

1. Go to [appleid.apple.com](https://appleid.apple.com)
2. Click "Create Your Apple ID"
3. Fill in your information and verify your email

### Step 2: Enroll in Apple Developer Program

**Free Account (for development only):**
- You can develop and test on your own devices
- Go to Xcode → Settings → Accounts
- Add your Apple ID
- This allows you to build and test on your iPhone/iPad

**Paid Account ($99/year - Required for App Store):**
- Required to publish apps to the App Store
- Go to [developer.apple.com/programs](https://developer.apple.com/programs)
- Click "Enroll"
- Complete the enrollment process (requires payment)

### Step 3: Configure Xcode

1. Open `ShoppingApp.xcodeproj` in Xcode
2. Select the project in the navigator
3. Go to "Signing & Capabilities"
4. Select your Team (your Apple ID)
5. Xcode will automatically create a provisioning profile

## Setting Up Payment Processing

### Option 1: Stripe (Recommended)

1. Create a Stripe account at [stripe.com](https://stripe.com)
2. Get your API keys from the Stripe Dashboard
3. For production, you'll need to:
   - Set up a backend server to handle payment processing securely
   - Never store API keys in the app itself

### Option 2: Apple Pay

1. Requires Apple Developer Program membership ($99/year)
2. Configure Apple Pay in your Apple Developer account
3. Add Apple Pay capability in Xcode:
   - Select your target
   - Go to "Signing & Capabilities"
   - Click "+ Capability"
   - Add "Apple Pay"
   - Configure your merchant ID

### Option 3: PayPal

1. Create a PayPal Business account at [paypal.com](https://paypal.com)
2. Get your PayPal SDK credentials
3. Integrate PayPal SDK (requires additional setup)

## Project Structure

```
ShoppingApp/
├── ShoppingAppApp.swift          # App entry point
├── ContentView.swift              # Main navigation
├── Models/
│   ├── Product.swift             # Product data model
│   ├── User.swift                # User data model
│   └── Order.swift               # Order data model
├── Managers/
│   ├── AuthenticationManager.swift
│   ├── CartManager.swift
│   └── OrderManager.swift
└── Views/
    ├── ProductCatalogView.swift
    ├── ProductDetailView.swift
    ├── CartView.swift
    ├── CheckoutView.swift
    ├── OrderTrackingView.swift
    ├── LoginView.swift
    └── ProfileView.swift
```

## Building and Running

1. **Open the project:**
   ```bash
   cd /Users/zhaoyixu/Documents/applications
   open ShoppingApp.xcodeproj
   ```

2. **Select a target device:**
   - Choose an iOS Simulator or connect your iPhone/iPad

3. **Build and run:**
   - Press `Cmd + R` or click the Play button
   - Xcode will build and launch the app

## Current Implementation Status

### ✅ Completed
- Product catalog with search and filtering
- User registration and login (local storage)
- Shopping cart functionality
- Checkout flow with address collection
- Order creation and tracking
- User profile management

### ⚠️ Needs Backend Integration
The current implementation uses local storage and simulated API calls. For production, you'll need to:

1. **Set up a backend server** (Node.js, Python, etc.)
2. **Implement real authentication** (Firebase, Auth0, or custom)
3. **Set up a database** (PostgreSQL, MongoDB, etc.)
4. **Integrate payment processing** (Stripe, PayPal APIs)
5. **Set up push notifications** for order updates

## Next Steps for Production

1. **Backend Development:**
   - Create REST API endpoints
   - Set up database for products, users, orders
   - Implement secure authentication (JWT tokens)
   - Set up payment webhooks

2. **Payment Integration:**
   - Integrate Stripe SDK or Apple Pay
   - Set up secure payment processing
   - Handle payment confirmations

3. **Additional Features:**
   - Push notifications
   - Email confirmations
   - Product reviews and ratings
   - Wishlist functionality
   - Social sharing

4. **Testing:**
   - Unit tests
   - UI tests
   - Integration tests

5. **App Store Submission:**
   - Prepare app icons and screenshots
   - Write app description
   - Submit for review

## Important Notes

- **Security**: Never commit API keys or secrets to version control
- **Payment Processing**: Always process payments on a secure backend server
- **User Data**: Ensure compliance with privacy regulations (GDPR, CCPA)
- **Testing**: Test thoroughly on real devices before release

## Support

For issues or questions:
- Apple Developer Documentation: [developer.apple.com/documentation](https://developer.apple.com/documentation)
- SwiftUI Documentation: [developer.apple.com/xcode/swiftui](https://developer.apple.com/xcode/swiftui)

## License

This project is provided as-is for development purposes.
