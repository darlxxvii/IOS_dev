import UIKit

//Step 1: Declare Variables for Personal Informa&on
//Create variables for the following personal details, as example:
//• firstName: Your first name (String).
//• lastName: Your last name (String).
//• age: Your current age (Int).
//• birthYear: The year you were born (Int).
//• isStudent: Whether or not you are currently a student (Bool).
//• height: Your height in meters (Double).
//Add some more details about you.
//Bonus Challenge: Create a constant currentYear and calculate your age by subtrac4ng birthYear from currentYear.

var firstName: String = "Nazerke"
var lastName: String = "Zheken"
var age: Int = 18
var birthYear: Int = 2007
var isStudent: Bool = true
var height: Double = 1.63
var city: String = "Almaty"
var ru: String = "Tore"
var school: String = "126"

let currentYear: Int = 2025

@MainActor
func findAge() -> Int {
    return currentYear - birthYear
}

//Step 2: Create Variables for Your Hobbies and Interests
//Declare variables for your hobbies and interests, as example:
//• hobby: Your favorite hobby (String).
//• numberOfHobbies: The total number of hobbies you have (Int).
//• favoriteNumber: Your favorite number (Int).
//• isHobbyCrea&ve: Whether your hobby is crea4ve (Bool).
//Add some more details about you.
//

var hobbies: [String] = ["reading", "painting", "watching anime", "movies", "TV shows"]
var numberOfHobbies: Int = hobbies.count
var favouriteNumber: Int = 7
var isHobbyCreative: Bool = true
var currentBook: String = "Think and Grow Rich"
var lastBook: String = "Rich Dad, Poor Dad"

//Step 3: Create a Summary of Your Life Story
//Use string interpola4on to combine all your variables into one final summary string. The summary should look something like:
//• “My name is John Doe. I am 20 years old, born in 2003. I am currently a student. I enjoy pain>ng, which is a crea>ve hobby. I have 5 hobbies in total, and my favorite number is 7.”

@MainActor
func Summary() -> String {
    let studentStatus = isStudent ? "I am a currently student." : "I am not a student."
    let creativeStatus = isHobbyCreative ? "which is a creative hobby." : "which is not a creative hobby."
    return """
    My name is \(firstName) \(lastName). I am \(findAge()) years old, born in \(birthYear).
    \(studentStatus)
    My height is \(height) m and I live in \(city).
    I enjoy \(hobbies[0]) and \(hobbies[1]) \(creativeStatus) Currently I am reading book called "\(currentBook)", and the last one was "\(lastBook)".
    I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favouriteNumber).
    """
}

//Step 4: Print Your Life Story
//• Use the print() func4on to print the final lifeStory string.

print(Summary())

//Bonus Task:
//Add an addi4onal variable for futureGoals (String), and append it to your life story (and any other interes4ng informa4on related to you 🙂). Also try to use emoji as value of variables and variable names.
//• Example: “In the future, I want to become a professional iOS developer.”

var futureGoals: String = "billionaire"
var favoriteAnimeCharacter: String = "Gojo Satoru"
var favouriteTvShow: String = "House of the Dragon"
var dreamCountry: String = "Japan 🇯🇵"
var favSport: String = "Gym 🏋️‍♀️"

@MainActor
func bonus() -> String {
    return """
    In the future, I want to become \(futureGoals). My favorite anime character is \(favoriteAnimeCharacter), and my favorite TV show is \(favouriteTvShow).
    I dream of visiting \(dreamCountry), and I also enjoy doing sports like \(favSport).
    """

}

print(bonus())
