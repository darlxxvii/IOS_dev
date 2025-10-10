//part 2
class ShoppingCart {
    private(set) var items: [CartItem]
    var discountCode: String?
    
    init() {
        self.items = []
        self.discountCode = nil
    }
    
    func addItem(product: Product, quantity: Int = 1) {
        guard quantity > 0 else { return }
        
        if let index = items.firstIndex(where: {$0.product.id == product.id}) {
            items[index].increaseQuantity(by: quantity) // ecли уже есть, то просто добавляем
        } else {
            items.append(CartItem(product: product, quantity: quantity))
        }
    }
    
    func removeItem(productId: String) {
        items.removeAll {$0.product.id == productId }
    }
    
    func updateItemQuantity(productId: String, quantity: Int) {
        guard let index = items.firstIndex(where: {$0.product.id == productId }) else { return }
        if quantity == 0 {
            items.remove(at: index) // убираем если 0
        } else {
            items[index].updateQuantity(quantity)
        }
    }
    
    func clearCart() {
        items.removeAll()
    }
    
    var subtotal: Double {
        items.reduce(0) {$0 + $1.subtotal }
    }
    
    var discountAmount: Double {
        guard let code = discountCode else { return 0 }
        let digits = code.filter { $0.isNumber }
        let percent = Int(digits) ?? 0

        return subtotal * Double(percent) / 100
    }
    
    var total: Double {
        subtotal - discountAmount
    }
    
    var itemCount: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
}
