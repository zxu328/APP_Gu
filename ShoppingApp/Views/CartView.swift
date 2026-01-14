import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var showCheckout = false
    
    var body: some View {
        NavigationView {
            VStack {
                if cartManager.items.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "cart")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("Your cart is empty")
                            .font(.title2)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach(cartManager.items) { item in
                            CartItemRow(item: item)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    
                    // Total and checkout
                    VStack(spacing: 12) {
                        HStack {
                            Text("Total:")
                                .font(.title2)
                            Spacer()
                            Text("$\(String(format: "%.2f", cartManager.total))")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                        }
                        .padding()
                        
                        Button(action: {
                            showCheckout = true
                        }) {
                            Text("Proceed to Checkout")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                    .background(Color(.systemBackground))
                }
            }
            .navigationTitle("Shopping Cart")
            .sheet(isPresented: $showCheckout) {
                CheckoutView()
            }
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            cartManager.removeItem(cartManager.items[index])
        }
    }
}

struct CartItemRow: View {
    let item: CartItem
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        HStack(spacing: 12) {
            // Product image placeholder
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 80, height: 80)
                .overlay(
                    Image(systemName: "photo")
                        .foregroundColor(.gray)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.product.name)
                    .font(.headline)
                
                Text("$\(String(format: "%.2f", item.product.price)) each")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack {
                    // Quantity controls
                    Button(action: {
                        cartManager.updateQuantity(item, quantity: item.quantity - 1)
                    }) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.blue)
                    }
                    
                    Text("\(item.quantity)")
                        .font(.subheadline)
                        .frame(minWidth: 30)
                    
                    Button(action: {
                        cartManager.updateQuantity(item, quantity: item.quantity + 1)
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.blue)
                    }
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("$\(String(format: "%.2f", item.subtotal))")
                    .font(.headline)
                    .foregroundColor(.blue)
                
                Button(action: {
                    cartManager.removeItem(item)
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
