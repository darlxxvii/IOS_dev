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

cart.clearCart()
print("Order count: \(order.itemCount)") // сохр старые товары
print("Cart count: \(cart.itemCount)")   // 0

