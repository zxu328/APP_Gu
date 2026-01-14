import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    
    var body: some View {
        Group {
            if authManager.isAuthenticated {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

struct MainTabView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        TabView {
            ProductCatalogView()
                .tabItem {
                    Label("Shop", systemImage: "storefront")
                }
            
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                        .badge(cartManager.items.count)
                }
            
            OrderTrackingView()
                .tabItem {
                    Label("Orders", systemImage: "list.bullet.clipboard")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthenticationManager())
        .environmentObject(CartManager())
        .environmentObject(OrderManager())
}
