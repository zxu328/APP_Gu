import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @State private var quantity = 1
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Product image
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 300)
                    .overlay(
                        Image(systemName: "photo")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                    )
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(product.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("$\(String(format: "%.2f", product.price))")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                    
                    Text(product.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("Category: \(product.category)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("In Stock: \(product.stock) items")
                        .font(.subheadline)
                        .foregroundColor(product.stock > 0 ? .green : .red)
                    
                    Divider()
                    
                    // Quantity selector
                    HStack {
                        Text("Quantity:")
                            .font(.headline)
                        
                        Spacer()
                        
                        HStack {
                            Button(action: {
                                if quantity > 1 {
                                    quantity -= 1
                                }
                            }) {
                                Image(systemName: "minus.circle")
                                    .font(.title2)
                            }
                            .disabled(quantity <= 1)
                            
                            Text("\(quantity)")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .frame(minWidth: 40)
                            
                            Button(action: {
                                if quantity < product.stock {
                                    quantity += 1
                                }
                            }) {
                                Image(systemName: "plus.circle")
                                    .font(.title2)
                            }
                            .disabled(quantity >= product.stock)
                        }
                    }
                    
                    // Add to cart button
                    Button(action: {
                        cartManager.addProduct(product, quantity: quantity)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "cart.badge.plus")
                            Text("Add to Cart")
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .padding(.top)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ProductDetailView(product: Product.sampleProducts[0])
            .environmentObject(CartManager())
    }
}
