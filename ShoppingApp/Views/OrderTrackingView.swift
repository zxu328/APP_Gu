import SwiftUI

struct OrderTrackingView: View {
    @EnvironmentObject var orderManager: OrderManager
    @State private var selectedOrder: Order?
    
    var body: some View {
        NavigationView {
            Group {
                if orderManager.orders.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "list.bullet.clipboard")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("No orders yet")
                            .font(.title2)
                            .foregroundColor(.secondary)
                        Text("Your orders will appear here")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach(orderManager.orders) { order in
                            OrderRow(order: order) {
                                selectedOrder = order
                            }
                        }
                    }
                }
            }
            .navigationTitle("My Orders")
            .sheet(item: $selectedOrder) { order in
                OrderDetailView(order: order)
            }
        }
    }
}

struct OrderRow: View {
    let order: Order
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Order #\(String(order.id.prefix(8)))")
                        .font(.headline)
                    Spacer()
                    StatusBadge(status: order.status)
                }
                
                Text(order.createdAt, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("\(order.items.count) item(s)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack {
                    Spacer()
                    Text("$\(String(format: "%.2f", order.totalAmount))")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
            }
            .padding(.vertical, 4)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct StatusBadge: View {
    let status: Order.OrderStatus
    
    var color: Color {
        switch status {
        case .pending: return .orange
        case .processing: return .blue
        case .shipped: return .purple
        case .delivered: return .green
        case .cancelled: return .red
        }
    }
    
    var body: some View {
        Text(status.rawValue)
            .font(.caption)
            .fontWeight(.semibold)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(color.opacity(0.2))
            .foregroundColor(color)
            .cornerRadius(8)
    }
}

struct OrderDetailView: View {
    let order: Order
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Order Info
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Order Information")
                            .font(.headline)
                        
                        HStack {
                            Text("Order ID:")
                            Spacer()
                            Text(String(order.id.prefix(8)))
                                .font(.system(.body, design: .monospaced))
                        }
                        
                        HStack {
                            Text("Date:")
                            Spacer()
                            Text(order.createdAt, style: .date)
                        }
                        
                        HStack {
                            Text("Status:")
                            Spacer()
                            StatusBadge(status: order.status)
                        }
                        
                        HStack {
                            Text("Payment Method:")
                            Spacer()
                            Text(order.paymentMethod)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Shipping Address
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Shipping Address")
                            .font(.headline)
                        Text(order.shippingAddress.formatted)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Order Items
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Order Items")
                            .font(.headline)
                        
                        ForEach(order.items) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.product.name)
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                    Text("Quantity: \(item.quantity)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Text("$\(String(format: "%.2f", item.subtotal))")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            }
                            .padding(.vertical, 4)
                            
                            if item.id != order.items.last?.id {
                                Divider()
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Total
                    HStack {
                        Text("Total Amount")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                        Text("$\(String(format: "%.2f", order.totalAmount))")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    .padding()
                }
                .padding()
            }
            .navigationTitle("Order Details")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

#Preview {
    OrderTrackingView()
        .environmentObject(OrderManager())
}
