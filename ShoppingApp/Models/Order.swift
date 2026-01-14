import Foundation

struct Order: Identifiable, Codable {
    let id: String
    let userId: String
    let items: [CartItem]
    let totalAmount: Double
    let status: OrderStatus
    let createdAt: Date
    let shippingAddress: Address
    let paymentMethod: String
    
    enum OrderStatus: String, Codable {
        case pending = "Pending"
        case processing = "Processing"
        case shipped = "Shipped"
        case delivered = "Delivered"
        case cancelled = "Cancelled"
    }
}

struct CartItem: Identifiable, Codable {
    let id: String
    let product: Product
    let quantity: Int
    
    var subtotal: Double {
        product.price * Double(quantity)
    }
}
