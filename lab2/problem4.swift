var shoppingList: [String] = []
var isRunning = true
func showMenu() {
    print("""
    \n--- Shopping List Menu ---
        1. Add item
        2. Remove item
        3. Display shopping list
        4. Exit
        Choose an option:
    """)
}
func wishToContinue() -> Bool{
    print("Do you wish to continue? y/n ")
    let answer = readLine()
    if answer == "y"{
        return true
    } else {
        return false
    }
}
while isRunning{
    showMenu()
    let choice = Int(readLine() ?? "")
    if let choice = choice {
        switch choice {
        case 1:
            print("Enter an item to add: ")
            if let item = readLine(), !item.isEmpty {
                shoppingList.append(item)
                print("\(item) added to the list.")
            }
        case 2:
            print("Enter an item to remove: ")
            if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
                shoppingList.remove(at: index)
                print("\(item) was removed.")
            }
        case 3:
            print("\n--- Shopping List ---")
            if shoppingList.isEmpty {
                print("List is empty.")
            } else {
                for (i, item) in shoppingList.enumerated() {
                    print("\(i+1). \(item)")
                }
            }
        case 4:
           print("Goodbye!")
           isRunning = false
        default:
            print("Invalid option.")
        }
        
    } else {
        print("Please enter a valid number.")
    }
    isRunning = wishToContinue()
    
}
