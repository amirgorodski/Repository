import UIKit

// *******************************************
// 1. Решить квадратное уравнение ax2 + bx + c

let firstMember: Double = 3
let secondMember: Double = 6
let thirdMember: Double = 3

func quadraticEquationSolution(a: Double, b: Double, c: Double) {
    var x1: Double
    var x2: Double
    let discriminant = pow(b, 2) - 4 * a * c
    
    if discriminant > 0 {
        x1 = (-b + sqrt(discriminant)) / (2 * a)
        x2 = (-b - sqrt(discriminant)) / (2 * a)
        print("The roots are: \(x1), \(x2)")
    } else if discriminant == 0 {
        x1 = -b / (2 * a)
        print("There's only one root: \(x1)")
    } else {
        print("There're no equation roots")
    }
}

quadraticEquationSolution(a: firstMember, b: secondMember, c: thirdMember)



// *********************************************************************************************
// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника

let firstTriangleLeg: Double = 3
let secondTriangleLeg: Double = 4
var hypotenuse: Double
var square: Double
var perimeter: Double


func hypotenuseCalculation(a: Double, b: Double) -> Double {
    return sqrt(pow(a, 2) + pow(b, 2))
}
hypotenuse = hypotenuseCalculation(a: firstTriangleLeg, b: secondTriangleLeg)

func squareCalculation(a: Double, b: Double) -> Double {
    return (a + b) / 2
}
square = squareCalculation(a: firstTriangleLeg, b: secondTriangleLeg)

func perimeterCalculation(a: Double, b: Double) -> Double {
    return a + b + hypotenuse
}
perimeter = perimeterCalculation(a: firstTriangleLeg, b: secondTriangleLeg)

print("The answer is: hypotenuse = \(hypotenuse), square = \(square), perimeter = \(perimeter)")




// ********************************************************************************************
// 3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет

let depositAmount = 100
let numberOfYears = 5
let annualPercent = 0.05
var totalProfit = Double()

func profitCalculation() {
    var temporarySum = Double(depositAmount)
    
    for _ in 0..<numberOfYears {
        temporarySum = temporarySum + temporarySum * annualPercent
    }
    
    totalProfit = temporarySum 
    print("The total profit over 5 years will be: \(totalProfit)")
}

profitCalculation()
