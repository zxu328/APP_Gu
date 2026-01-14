import Foundation
import Combine

class OrderManager: ObservableObject {
    @Published var orders: [Order] = []
    
    func createOrder(from cartItems: [CartItem], shippingAddress: Address, paymentMethod: String) -> Order {
        let order = Order(
            id: UUID().uuidString,
            userId: "current_user_id", // In real app, get from auth manager
            items: cartItems,
            totalAmount: cartItems.reduce(0) { $0 + $1.subtotal },
            status: .pending,
            createdAt: Date(),
            shippingAddress: shippingAddress,
            paymentMethod: paymentMethod
        )
        
        orders.insert(order, at: 0) // Add to beginning
        return order
    }
    
    func updateOrderStatus(_ orderId: String, status: Order.OrderStatus) {
        if let index = orders.firstIndex(where: { $0.id == orderId }) {
            let order = orders[index]
            orders[index] = Order(
                id: order.id,
                userId: order.userId,
                items: order.items,
                totalAmount: order.totalAmount,
                status: status,
                createdAt: order.createdAt,
                shippingAddress: order.shippingAddress,
                paymentMethod: order.paymentMethod
            )
        }
    }
    
    func getOrder(by id: String) -> Order? {
        orders.first { $0.id == id }
    }
}
