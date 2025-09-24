func celciusToFahrenheit(_ value: Double) -> Double {
    return value * 9/5 + 32
}
func kelvinToFahrenheit(_ value: Double) -> Double {
    return (value - 273.15) * 9/5 + 32
}
func celciusToKelvin(_ value: Double) -> Double {
    return value + 273.15
}
func kelvinToCelcius(_ value: Double) -> Double {
    return value - 273.15
}
func fahrenheitToCelcius(_ value: Double) -> Double {
    return (value - 32) * 5/9
}
func fahrenheitToKelvin(_ value: Double) -> Double {
    return (value - 32) * 5/9 + 273.15
}

print("Input the temperature value:")
let value = Double(readLine() ?? "0") ?? 0
print("Select the unit:")
let unit = (readLine() ?? "").uppercased()

if unit == "K" {
    print("Kelvin: \(value)")
    
    print("Fahrenheit: \(kelvinToFahrenheit(value))")
    
    print("Celcius: \(kelvinToCelcius(value))")

}
else if unit == "C" {
    print("Celcius: \(value)")
    
    print("Fahrenheit: \(celciusToFahrenheit(value))")
    
    print("Kelvin: \(celciusToKelvin(value))")
}
else if unit == "F" {
    print("Fahrenheit: \(value)")
    
    print("Kelvin: \(fahrenheitToKelvin(value))")
    
    print("Celcius: \(fahrenheitToCelcius(value))")
    
}
