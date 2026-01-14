# Quick Start Guide

## Get Started in 5 Minutes

### 1. Install Xcode
- Open Mac App Store
- Search "Xcode" and install
- Wait for installation (15-20 minutes)

### 2. Add Your Apple ID
- Open Xcode
- Go to **Xcode → Settings → Accounts**
- Click **"+"** and add your Apple ID
- This gives you a FREE developer account

### 3. Open the Project
```bash
cd /Users/zhaoyixu/Documents/applications
open ShoppingApp.xcodeproj
```

### 4. Configure Signing
- In Xcode, select **ShoppingApp** project (blue icon)
- Select **ShoppingApp** target
- Go to **Signing & Capabilities** tab
- Select your **Team** (your Apple ID)
- Change Bundle Identifier if needed (e.g., `com.yourname.ShoppingApp`)

### 5. Run the App
- Select **iPhone 15 Simulator** from device menu (top toolbar)
- Press **⌘ + R** (Command + R)
- App will build and launch!

## What You Get

✅ **Product Catalog** - Browse and search products  
✅ **User Registration** - Sign up and login  
✅ **Shopping Cart** - Add/remove items  
✅ **Checkout** - Complete purchase flow  
✅ **Payment UI** - Ready for Stripe/Apple Pay integration  
✅ **Order Tracking** - View order history and status  
✅ **User Profile** - Manage account information  

## Current Status

**Working Now:**
- All UI screens and navigation
- Local data storage (UserDefaults)
- Simulated authentication
- Shopping cart functionality
- Order creation and tracking

**Needs Backend (For Production):**
- Real user authentication
- Product database
- Payment processing
- Order management server
- Email notifications

## Next Steps

1. **Test the app** - Try all features
2. **Customize products** - Edit `Product.sampleProducts` in `Models/Product.swift`
3. **Set up backend** - When ready for production
4. **Add payment SDKs** - Stripe or Apple Pay
5. **Design app icon** - Add to Assets.xcassets

## Common Commands

```bash
# Open project
open ShoppingApp.xcodeproj

# Clean build (if having issues)
# In Xcode: Product → Clean Build Folder (⌘ + Shift + K)

# View project files
ls -la ShoppingApp/
```

## File Structure

```
ShoppingApp/
├── ShoppingAppApp.swift       # App entry point
├── ContentView.swift           # Main navigation
├── Models/                     # Data models
│   ├── Product.swift
│   ├── User.swift
│   └── Order.swift
├── Managers/                   # Business logic
│   ├── AuthenticationManager.swift
│   ├── CartManager.swift
│   └── OrderManager.swift
└── Views/                      # UI screens
    ├── ProductCatalogView.swift
    ├── ProductDetailView.swift
    ├── CartView.swift
    ├── CheckoutView.swift
    ├── OrderTrackingView.swift
    ├── LoginView.swift
    └── ProfileView.swift
```

## Troubleshooting

**"No signing certificate"**
→ Go to Xcode Settings → Accounts → Download Manual Profiles

**"Bundle identifier in use"**
→ Change it in Signing & Capabilities tab

**App won't build**
→ Clean Build Folder (⌘ + Shift + K), then rebuild

**Simulator won't launch**
→ Try a different simulator model

## Need Help?

- See `SETUP_GUIDE.md` for detailed instructions
- See `README.md` for full documentation
- Check Xcode console for error messages

Happy coding! 🎉
