import UIKit

//part 1.1
struct Product {
    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String
    
    enum Category: String {
        case electronics, clothing, food, books
    }
    
    var displayPrice: String {
        return String(format: "$%.2f", price)
    }
    
    // не даём создать если цена <= 0
    init?(id: String, name: String, price: Double, category: Category, description: String) {
        guard price > 0 else { return nil }
        self.id = id
        self.price = price
        self.name = name
        self.category = category
        self.description = description
    }
}
//part 1.2
struct CartItem {
    let product: Product
    var quantity: Int
    
    var subtotal: Double {
        return product.price * Double(quantity)
    }
    
    mutating func updateQuantity(_ newQuantity: Int) {
        guard newQuantity > 0 else { return }
        quantity = newQuantity
    }
    
    mutating func increaseQuantity(by amount: Int) {
        guard amount > 0 else { return }
        quantity += amount
    }
}

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
            items[index].increaseQuantity(by: quantity)
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
            items.remove(at: index)
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

//part 3.1

struct Address {
    let street: String
    let city: String
    let zipCode: String
    let country: String
    
    var formattedAddress: String {
        "\(street)\n\(city), \(zipCode)\n\(country)"
    }
}

//part 3.2
struct Order {
    let orderId: String
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: Address
    
    init(from cart: ShoppingCart, shippingAddress: Address) {
        self.orderId = UUID().uuidString
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }
    
    var itemCount: Int {
            items.reduce(0) { $0 + $1.quantity }
    }
}
//part 4

// Sample Products
let chocolate = Product(id: "p1", name: "Chocolate", price: 1000, category: .food, description: "Delicious Kazakhstan Dark Chocolate")!
let book = Product(id: "p2", name: "Think and Grow Rich", price: 4000, category: .books, description: "Book that will help you get rich")!
let skirt = Product(id: "p3", name: "Skirt", price: 12000, category: .clothing, description: "Woman pink midi skirt")!

// Shopping cart
let cart = ShoppingCart()
cart.addItem(product: chocolate, quantity: 2)
cart.addItem(product: book, quantity: 1)
cart.addItem(product: skirt, quantity: 2)

cart.addItem(product: chocolate, quantity: 1)

print("Subtotal: \(cart.subtotal)")
print("Item count: \(cart.itemCount)")

cart.discountCode = "SUMMER20"
print("Total with discount: \(cart.total)")

cart.removeItem(productId: skirt.id)

// Reference type behavior
func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: book, quantity: 2)
}
modifyCart(cart)
print("Cart now has \(cart.itemCount) items") // изменился ориг

// Value type behavior
let item1 = CartItem(product: chocolate, quantity: 1)
var item2 = item1
item2.updateQuantity(5)
print("item1 qty: \(item1.quantity), item2 qty: \(item2.quantity)")

// Create order snapshot
let address = Address(street: "Egizbayeva", city: "Almaty", zipCode: "050040", country: "Kazakhstan")
let order = Order(from: cart, shippingAddress: address)

//cart.clearCart()
print("Order count: \(order.itemCount)") // сохр старые товары
print("Cart count: \(cart.itemCount)")   // 0

// bonus 1

class User {
    let userId: String
    let name: String
    let email: String
    private(set) var orderHistory: [Order]
    
    init(name: String, email: String) {
        self.userId = UUID().uuidString
        self.name = name
        self.email = email
        self.orderHistory = []
    }
    
    // добавляем заказ в историю
    func placeOrder(_ order: Order) {
        orderHistory.append(order)
    }
    
    // считаем сколько потратил юзер
    var totalSpent: Double {
        orderHistory.reduce(0) { $0 + $1.total }
    }
}

let user = User(name: "Erlan", email: "ye123@gmail.com")
let address1 = Address(street: "Zharokova 12", city: "Almaty", zipCode: "050035", country: "Kazakhstan")
let order1 = Order(from: cart, shippingAddress: address1)

user.placeOrder(order1)
print("\nTotal spent: \(user.totalSpent)")

// bonus 2

enum DiscountType {
    case percentage(Double)     // 0.10 -> 10%
    case fixedAmount(Double)    // 5 -> $5
    case buyXGetY(buy: Int, get: Int) // как 1+1
}

// bonus 3

