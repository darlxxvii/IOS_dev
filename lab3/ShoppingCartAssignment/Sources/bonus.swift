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
