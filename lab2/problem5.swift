func countWords(_ sentence: String){
    let cleaned = sentence
            .lowercased()
            .filter { !$0.isPunctuation } // to leave only words 
    let words = cleaned.split(separator: " ").map { String($0) } // to make a list from left words
    var frequency: [String: Int] = [:] 
    for word in words {
        frequency[word, default: 0] += 1
    }
    
    print("\nWord Frequencies: ")
        for (word, count) in frequency {
            print("\(word): \(count)")
        }
}
print("Please enter a sentence: ")
let sentence = readLine() ?? ""
countWords(sentence)
