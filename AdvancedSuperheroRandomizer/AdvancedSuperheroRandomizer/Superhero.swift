struct Superhero: Codable {
    let id: Int
    let name: String
    let powerstats: Powerstats
    let biography: Biography
    let images: Images
}

struct Powerstats: Codable {
    let intelligence: Int?
    let strength: Int?
    let speed: Int?
    let durability: Int?
    let power: Int?
    let combat: Int?
}

struct Biography: Codable {
    let fullName: String
    let placeOfBirth: String
    let alignment: String
}

struct Images: Codable {
    let xs: String
    let sm: String
    let md: String
    let lg: String
}
