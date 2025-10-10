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
