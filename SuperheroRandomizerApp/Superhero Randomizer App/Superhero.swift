import Foundation

struct Superhero: Codable {
    let id: Int
    let name: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let images: Images
}

struct Powerstats: Codable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let power: Int
}

struct Appearance: Codable {
    let gender: String
    let race: String?
    let height: [String]
    let weight: [String]
    let eyeColor: String
    let hairColor: String
}

struct Biography: Codable {
    let fullName: String
    let publisher: String?
    let alignment: String
}

struct Images: Codable {
    let xs: String
    let sm: String
    let md: String
    let lg: String
}
