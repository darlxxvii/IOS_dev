func hasUniqueCharacters(_ text: String) -> Bool {
    var seenChars: Set<Character> = [] // пустое множество, чтобы хранить встреченные символы
    
    for char in text {
        if seenChars.contains(char) { // eсли символ уже встречался то значит не уникально и возвращаем false
            return false // нашли повтор
        }
        seenChars.insert(char) // eсли символа не было то добавляем его в множество
    }
    return true
}

print(hasUniqueCharacters("qwerty"))     // true
print(hasUniqueCharacters("Helloo"))     // false
print(hasUniqueCharacters("Aaa"))        // true
