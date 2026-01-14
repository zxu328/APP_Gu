import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var orderManager: OrderManager
    @EnvironmentObject var authManager: AuthenticationManager
    @Environment(\.presentationMode) var presentationMode
    
    @State private var shippingAddress = Address(
        street: "",
        city: "",
        state: "",
        zipCode: "",
        country: "United States"
    )
    @State private var paymentMethod = "Credit Card"
    @State private var cardNumber = ""
    @State private var expiryDate = ""
    @State private var cvv = ""
    @State private var cardholderName = ""
    @State private var showPaymentSheet = false
    @State private var isProcessing = false
    @State private var showSuccess = false
    
    let paymentMethods = ["Credit Card", "Apple Pay", "PayPal"]
    
    var body: some View {
        NavigationView {
            Form {
                // Shipping Address Section
                Section(header: Text("Shipping Address")) {
                    TextField("Street Address", text: $shippingAddress.street)
                    TextField("City", text: $shippingAddress.city)
                    TextField("State", text: $shippingAddress.state)
                    TextField("ZIP Code", text: $shippingAddress.zipCode)
                    TextField("Country", text: $shippingAddress.country)
                }
                
                // Payment Method Section
                Section(header: Text("Payment Method")) {
                    Picker("Payment Method", selection: $paymentMethod) {
                        ForEach(paymentMethods, id: \.self) { method in
                            Text(method).tag(method)
                        }
                    }
                    
                    if paymentMethod == "Credit Card" {
                        TextField("Cardholder Name", text: $cardholderName)
                        TextField("Card Number", text: $cardNumber)
                            .keyboardType(.numberPad)
                        HStack {
                            TextField("MM/YY", text: $expiryDate)
                            TextField("CVV", text: $cvv)
                                .keyboardType(.numberPad)
                        }
                    } else if paymentMethod == "Apple Pay" {
                        Button(action: {
                            showPaymentSheet = true
                        }) {
                            HStack {
                                Image(systemName: "applelogo")
                                Text("Pay with Apple Pay")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                }
                
                // Order Summary Section
                Section(header: Text("Order Summary")) {
                    ForEach(cartManager.items) { item in
                        HStack {
                            Text(item.product.name)
                            Spacer()
                            Text("\(item.quantity)x $\(String(format: "%.2f", item.product.price))")
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    HStack {
                        Text("Total")
                            .font(.headline)
                        Spacer()
                        Text("$\(String(format: "%.2f", cartManager.total))")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                }
                
                // Place Order Button
                Section {
                    Button(action: {
                        processPayment()
                    }) {
                        if isProcessing {
                            ProgressView()
                                .frame(maxWidth: .infinity)
                        } else {
                            Text("Place Order")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .disabled(isProcessing || !isFormValid)
                }
            }
            .navigationTitle("Checkout")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
            .alert("Order Placed!", isPresented: $showSuccess) {
                Button("OK") {
                    cartManager.clearCart()
                    presentationMode.wrappedValue.dismiss()
                }
            } message: {
                Text("Your order has been placed successfully. You can track it in the Orders tab.")
            }
        }
    }
    
    private var isFormValid: Bool {
        !shippingAddress.street.isEmpty &&
        !shippingAddress.city.isEmpty &&
        !shippingAddress.state.isEmpty &&
        !shippingAddress.zipCode.isEmpty &&
        (paymentMethod != "Credit Card" || (!cardNumber.isEmpty && !expiryDate.isEmpty && !cvv.isEmpty && !cardholderName.isEmpty))
    }
    
    private func processPayment() {
        isProcessing = true
        
        // Simulate payment processing
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // Create order
            let order = orderManager.createOrder(
                from: cartManager.items,
                shippingAddress: shippingAddress,
                paymentMethod: paymentMethod
            )
            
            // Simulate order status updates
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                orderManager.updateOrderStatus(order.id, status: .processing)
            }
            
            isProcessing = false
            showSuccess = true
        }
    }
}

#Preview {
    CheckoutView()
        .environmentObject(CartManager())
        .environmentObject(OrderManager())
        .environmentObject(AuthenticationManager())
}
