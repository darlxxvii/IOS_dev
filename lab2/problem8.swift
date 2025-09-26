func isPalindrome(_ text: String) -> Bool {
    let cleaned = text.lowercased().filter{ !$0.isPunctuation && !$0.isWhitespace }
    return cleaned == String(cleaned.reversed())
}
print(isPalindrome("abba"))             // true
print(isPalindrome("Gojo Satory one love")) //false
