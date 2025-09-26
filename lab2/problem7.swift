let students: [String: Int] = [
    "Aigerim": 75,
    "Amina": 72,
    "Ansagan": 94,
    "Aruna": 100,
    "Miras": 90
]
// calculating avg
let scores = Array(students.values)
var total = 0
for score in scores {
    total += score
}
let avg = Double(total) / Double(scores.count)

// searching for max and min
if let maxScore = scores.max(),
   let minScore = scores.min() {
    print("Average score: \(avg)")
    print("Highest score: \(maxScore)")
    print("Lowest score: \(minScore)")
    
    print("\nStudent Results")
    
    for (name, score) in students {
        if Double(score) >= avg {
            print("\(name): \(score) is above average")
        } else {
            print("\(name): \(score) is below average")
        }
    }
}
