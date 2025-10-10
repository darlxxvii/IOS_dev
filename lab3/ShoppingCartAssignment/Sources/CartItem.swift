//part 1.2
struct CartItem {
    let product: Product
    var quantity: Int
    
    var subtotal: Double {
        return product.price * Double(quantity)
    }
  
    //обновляем количество
    mutating func updateQuantity(_ newQuantity: Int) { 
        guard newQuantity > 0 else { return }
        quantity = newQuantity
    }
  
    //увеличиваем количество
    mutating func increaseQuantity(by amount: Int) {
        guard amount > 0 else { return }
        quantity += amount
    }
}
