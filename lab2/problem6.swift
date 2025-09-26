func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 { // если n <= 0, то пустой массив
        return []
    }
    if n == 1 { // если n == 1, возвращаем [0]
        return [0]
    }
    
    var sequence = [0, 1] // начальные два числа Фибоначчи
    
    for i in 2..<n { // для вычисления остальных чисел
        let next = sequence[i - 1] + sequence[i - 2]
        sequence.append(next)
    }
    
    return sequence
}

var n = 5
fibonacci(n)
