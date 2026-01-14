import Foundation
import Combine

class CartManager: ObservableObject {
    @Published var items: [CartItem] = []
    
    var total: Double {
        items.reduce(0) { $0 + $1.subtotal }
    }
    
    var itemCount: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
    
    func addProduct(_ product: Product, quantity: Int = 1) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index] = CartItem(
                id: items[index].id,
                product: product,
                quantity: items[index].quantity + quantity
            )
        } else {
            let newItem = CartItem(
                id: UUID().uuidString,
                product: product,
                quantity: quantity
            )
            items.append(newItem)
        }
    }
    
    func removeItem(_ item: CartItem) {
        items.removeAll { $0.id == item.id }
    }
    
    func updateQuantity(_ item: CartItem, quantity: Int) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            if quantity > 0 {
                items[index] = CartItem(
                    id: item.id,
                    product: item.product,
                    quantity: quantity
                )
            } else {
                items.remove(at: index)
            }
        }
    }
    
    func clearCart() {
        items.removeAll()
    }
}
