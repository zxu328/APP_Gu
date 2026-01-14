import Foundation

struct Product: Identifiable, Codable {
    let id: String
    let name: String
    let description: String
    let price: Double
    let imageURL: String?
    let category: String
    let stock: Int
    
    init(id: String = UUID().uuidString, name: String, description: String, price: Double, imageURL: String? = nil, category: String, stock: Int = 100) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.imageURL = imageURL
        self.category = category
        self.stock = stock
    }
}

extension Product {
    static let sampleProducts: [Product] = [
        Product(name: "Wireless Headphones", description: "Premium noise-cancelling wireless headphones with 30-hour battery life", price: 199.99, category: "Electronics", stock: 50),
        Product(name: "Smart Watch", description: "Fitness tracking smartwatch with heart rate monitor and GPS", price: 299.99, category: "Electronics", stock: 30),
        Product(name: "Laptop Stand", description: "Ergonomic aluminum laptop stand for better posture", price: 49.99, category: "Accessories", stock: 75),
        Product(name: "USB-C Cable", description: "High-speed USB-C charging cable, 6ft length", price: 19.99, category: "Accessories", stock: 200),
        Product(name: "Wireless Mouse", description: "Ergonomic wireless mouse with precision tracking", price: 39.99, category: "Accessories", stock: 100),
        Product(name: "Mechanical Keyboard", description: "RGB backlit mechanical keyboard with blue switches", price: 129.99, category: "Accessories", stock: 40)
    ]
}
