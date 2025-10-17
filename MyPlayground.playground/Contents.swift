import UIKit
////problem 1
//for i in 1...100{
//    if i % 3 == 0 && i % 5 == 0 {
//        print("FizzBuzz")
//    }
//    else if i % 5 == 0 {
//        print("Buzz")
//    }
//    else if i % 3 == 0 {
//        print("Fizz")
//    }
//    else {
//            print(i)
//    }
//}

////Problem 2: Prime Numbers
//Create a func9on isPrime(_ number: Int) -> Bool that determines whether a given number is prime. Then, use this func9on to print all prime numbers between 1 and 100. Requirements:
//• Use loops and condi9onal statements within your func9on.
//• Call the func9on in your main program to display the prime numbers

//func isPrime(_ number: Int) -> Bool {
//    if number < 2 {return false}
//    for i in 2...(number / 2 + 1){
//        if number % i == 0{
//            return false
//        }
//                    
//    }
//    return true
//                  
//}
//
//for i in 1...100 {
//    if isPrime(i) {
//        print(i)
//    }
//}

//Problem 3: Temperature Converter
//Write a Swi7 program that converts temperatures between Celsius, Fahrenheit, and Kelvin. Program Specifica:ons:
//• Prompt the user to input a temperature value.
//• Ask the user to specify the unit of the entered temperature (C, F, or K).
//• Convert the temperature to the other two units.
//• Display the results with appropriate labels.
//Requirements:
//• Use condi9onal statements to handle different units.
//• Use func9ons to perform the conversions.
//
//func celciusToFahrenheit(_ value: Double) -> Double {
//    return value * 9/5 + 32
//}
//func kelvinToFahrenheit(_ value: Double) -> Double {
//    return (value - 273.15) * 9/5 + 32
//}
//func celciusToKelvin(_ value: Double) -> Double {
//    return value + 273.15
//}
//func kelvinToCelcius(_ value: Double) -> Double {
//    return value - 273.15
//}
//func fahrenheitToCelcius(_ value: Double) -> Double {
//    return (value - 32) * 5/9
//}
//func fahrenheitToKelvin(_ value: Double) -> Double {
//    return (value - 32) * 5/9 + 273.15
//}
//
//print("Input the temperature value:")
//let value = 10.00
//print("Select the unit:")
//let unit = "C"
//
//if unit == "K" {
//    print("Kelvin: \(value)")
//    
//    print("Fahrenheit: \(kelvinToFahrenheit(value))")
//    
//    print("Celcius: \(kelvinToCelcius(value))")
//
//}
//else if unit == "C" {
//    print("Celcius: \(value)")
//    
//    print("Fahrenheit: \(celciusToFahrenheit(value))")
//    
//    print("Kelvin: \(celciusToKelvin(value))")
//}
//else if unit == "F" {
//    print("Fahrenheit: \(value)")
//    
//    print("Kelvin: \(fahrenheitToKelvin(value))")
//    
//    print("Celcius: \(fahrenheitToCelcius(value))")
//    
//}
//Problem 4: Shopping List Manager
//Develop a simple shopping list applica9on.
//Program Features:
//• Allow the user to add items to the shopping list.
//• Allow the user to remove items from the shopping list.
//• Display the current shopping list.
//• Provide an op9on to exit the applica9on.
//Requirements:
//• Use an array to store the shopping list items.
//• Use loops and condi9onal statements to manage user input.
//• Display a user-friendly menu for interac9on.



//var shoppingList: [String] = []
//var isRunning = true
//func showMenu() {
//    print("""
//    \n--- Shopping List Menu ---
//        1. Add item
//        2. Remove item
//        3. Display shopping list
//        4. Exit
//        Choose an option:
//    """)
//}
//func wishToContinue() -> Bool{
//    print("Do you wish to continue? y/n ")
//    let answer = readLine()
//    if answer == "y"{
//        return true
//    } else {
//        return false
//    }
//}
//while isRunning{
//    showMenu()
//    let choice = Int(readLine() ?? "")
//    if let choice = choice {
//        switch choice {
//        case 1:
//            print("Enter an item to add: ")
//            if let item = readLine(), !item.isEmpty {
//                shoppingList.append(item)
//                print("\(item) added to the list.")
//            }
//        case 2:
//            print("Enter an item to remove: ")
//            if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
//                shoppingList.remove(at: index)
//                print("\(item) was removed.")
//            }
//        case 3:
//            print("\n--- Shopping List ---")
//            if shoppingList.isEmpty {
//                print("List is empty.")
//            } else {
//                for (i, item) in shoppingList.enumerated() {
//                    print("\(i+1). \(item)")
//                }
//            }
//        case 4:
//           print("Goodbye!")
//           isRunning = false
//        default:
//            print("Invalid option.")
//        }
//        
//    } else {
//        print("Please enter a valid number.")
//    }
//    isRunning = wishToContinue()
//    
//}

//Problem 5: Word Frequency Counter
//Write a Swi7 program that counts the frequency of each word in a given sentence. Program Specifica:ons:
//• Prompt the user to enter a sentence.
//• Count how many 9mes each word appears.
//• Display the words and their corresponding frequencies.
//Requirements:
//• Use a dic9onary to store word-frequency pairs.
//• Ignore punctua9on and make the word count case-insensi9ve.
//• Use loops to iterate through the words.
 
//func countWords(_ sentence: String){
//    let cleaned = sentence
//            .lowercased()
//            .filter { !$0.isPunctuation }
//    let words = cleaned.split(separator: " ").map { String($0) }
//    var frequency: [String: Int] = [:]
//    for word in words {
//        frequency[word, default: 0] += 1
//    }
//    
//    print("\nWord Frequencies: ")
//        for (word, count) in frequency {
//            print("\(word): \(count)")
//        }
//}
//print("Please enter a sentence: ")
//let sentence = readLine() ?? ""
//countWords(sentence)

//
//Problem 6: Fibonacci Sequence
//Implement a func9on fibonacci(_ n: Int) -> [Int] that returns an array containing the first n numbers of the Fibonacci sequence.
//Requirements:
//• Use loops to calculate the sequence.
//• Handle cases where n is less than or equal to zero by returning an empty array.

//func fibonacci(_ n: Int) -> [Int] {
//    if n <= 0 { // если n <= 0, то пустой массив
//        return []
//    }
//    if n == 1 { // если n == 1, возвращаем [0]
//        return [0]
//    }
//    
//    var sequence = [0, 1] // начальные два числа Фибоначчи
//    
//    for i in 2..<n { // для вычисления остальных чисел
//        let next = sequence[i - 1] + sequence[i - 2]
//        sequence.append(next)
//    }
//    
//    return sequence
//}
//
//var n = 5
//fibonacci(n)

//
//Create a program that processes student test scores. Program Features:
//• Accept a list of student names and their corresponding test scores.
//• Calculate the average score.
//• Determine the highest and lowest scores.
//• Display each student’s name with their score and indicate if they are above or below the
//average. Requirements:
//• Use arrays or dic9onaries to store student data.
//• Use loops to process the data.
//• Use condi9onal statements to compare scores.

//let students: [String: Int] = [
//    "Aigerim": 75,
//    "Amina": 72,
//    "Ansagan": 94,
//    "Aruna": 100,
//    "Miras": 90
//]
//// calculating avg
//let scores = Array(students.values)
//var total = 0
//for score in scores {
//    total += score
//}
//let avg = Double(total) / Double(scores.count)
//
//// searching for max and min
//if let maxScore = scores.max(),
//   let minScore = scores.min() {
//    print("Average score: \(avg)")
//    print("Highest score: \(maxScore)")
//    print("Lowest score: \(minScore)")
//    
//    print("\nStudent Results")
//    
//    for (name, score) in students {
//        if Double(score) >= avg {
//            print("\(name): \(score) is above average")
//        } else {
//            print("\(name): \(score) is below average")
//        }
//    }
//}

//Problem 8: Palindrome Checker
//Write a func9on isPalindrome(_ text: String) -> Bool that checks whether a given string is a palindrome.
//Requirements:
//• Ignore spaces, punctua9on, and make the check case-insensi9ve.
//• Return true if the string is a palindrome, false otherwise.
//
//func isPalindrome(_ text: String) -> Bool {
//    let cleaned = text.lowercased().filter{ !$0.isPunctuation && !$0.isWhitespace }
//    return cleaned == String(cleaned.reversed())
//}
//print(isPalindrome("abba"))             // true
//print(isPalindrome("Gojo Satory one love")) //false

//Problem 9: Simple Calculator
//Create a program that func9ons as a simple calculator. Program Features:
//• Prompt the user to enter two numbers.
//• Ask the user to choose an opera9on: addi9on (+), subtrac9on (-), mul9plica9on (*), or
//division (/).
//• Perform the calcula9on and display the result.
//• Allow the user to perform mul9ple calcula9ons un9l they choose to exit.
//Requirements:
//• Use func9ons to perform each opera9on.
//• Handle division by zero with an appropriate error message.
//• Use a loop to con9nue the program based on user input.

// Функции для каждой операции
//func add(_ a: Double, _ b: Double) -> Double {
//    return a + b
//}
//
//func subtract(_ a: Double, _ b: Double) -> Double {
//    return a - b
//}
//
//func multiply(_ a: Double, _ b: Double) -> Double {
//    return a * b
//}
//
//func divide(_ a: Double, _ b: Double) -> Double? {
//    if b == 0 {
//        return nil //если делим на ноль
//    }
//    return a / b
//}
//
//var isRunning = true // флаг для управления циклом
//
//while isRunning {
//    print("\nEnter the first number: ")
//    guard let firstInput = readLine(), let num1 = Double(firstInput) else {
//        print("Invalid number. Try again.") // ошибка если ввод не число
//        continue
//    }
//    
//    print("Enter the second number: ")
//    guard let secondInput = readLine(), let num2 = Double(secondInput) else {
//        print("Invalid number. Try again.")
//        continue
//    }
//    // Меню
//    print("""
//    Choose an operation:
//    + for addition
//    - for subtraction
//    * for multiplication
//    / for division
//    """)
//    
//    if let operation = readLine() {
//        var result: Double?
//        
//        switch operation {
//        case "+":
//            result = add(num1, num2)
//        case "-":
//            result = subtract(num1, num2)
//        case "*":
//            result = multiply(num1, num2)
//        case "/":
//            if let div = divide(num1, num2) {
//                result = div
//            } else {
//                print("Error: Division by zero is not allowed.") // проверка на деление на ноль
//            }
//        default:
//            print("Invalid operation.")
//        }
//        
//        if let result = result {
//            print("Result: \(result)")
//        }
//    }
//    // хочет ли пользователь продолжить
//    print("Do you want to perform another calculation? (y/n)")
//    if let again = readLine(), again.lowercased() != "y" {
//        isRunning = false
//        print("Goodbye!")
//    }
//}
//Problem 10: Unique Characters
//Write a func9on hasUniqueCharacters(_ text: String) -> Bool that determines if a string has all unique characters.
//Requirements:
//• Consider le[ers case-sensi9vely (e.g., 'A' and 'a' are different).
//• Return true if all characters are unique, false otherwise.
//Submission Guidelines
//• Ensure your code compiles and runs without errors.
//• Include comments explaining your code logic.
//• Organize your code for readability (use proper indenta9on and spacing).
//• Submit all .swi7 files in a git repository
//Grading Criteria
//• Correctness: Solu9ons meet the problem requirements and produce the correct output.
//• Code Quality: Code is clean, well-organized, and follows Swi7 naming conven9ons.
//• Comments: Code includes comments that explain the logic and flow.
//• Func:onality: Programs handle user input gracefully and perform necessary error
//checking.
//
//
//func hasUniqueCharacters(_ text: String) -> Bool {
//    var seenChars: Set<Character> = [] // пустое множество, чтобы хранить встреченные символы
//    
//    for char in text {
//        if seenChars.contains(char) { // eсли символ уже встречался то значит не уникально и возвращаем false
//            return false // нашли повтор
//        }
//        seenChars.insert(char) // eсли символа не было то добавляем его в множество
//    }
//    return true
//}
//
//print(hasUniqueCharacters("qwerty"))     // true
//print(hasUniqueCharacters("Helloo"))     // false
//print(hasUniqueCharacters("Aaa"))        // true
