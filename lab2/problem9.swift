// Функции для каждой операции
func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double? {
    if b == 0 {
        return nil //если делим на ноль
    }
    return a / b
}

var isRunning = true // флаг для управления циклом

while isRunning {
    print("\nEnter the first number: ")
    guard let firstInput = readLine(), let num1 = Double(firstInput) else {
        print("Invalid number. Try again.") // ошибка если ввод не число
        continue
    }
    
    print("Enter the second number: ")
    guard let secondInput = readLine(), let num2 = Double(secondInput) else {
        print("Invalid number. Try again.")
        continue
    }
    // Меню
    print("""
    Choose an operation:
    + for addition
    - for subtraction
    * for multiplication
    / for division
    """)
    
    if let operation = readLine() {
        var result: Double?
        
        switch operation {
        case "+":
            result = add(num1, num2)
        case "-":
            result = subtract(num1, num2)
        case "*":
            result = multiply(num1, num2)
        case "/":
            if let div = divide(num1, num2) {
                result = div
            } else {
                print("Error: Division by zero is not allowed.") // проверка на деление на ноль
            }
        default:
            print("Invalid operation.")
        }
        
        if let result = result {
            print("Result: \(result)")
        }
    }
    // хочет ли пользователь продолжить
    print("Do you want to perform another calculation? (y/n)")
    if let again = readLine(), again.lowercased() != "y" {
        isRunning = false
        print("Goodbye!")
    }
}
