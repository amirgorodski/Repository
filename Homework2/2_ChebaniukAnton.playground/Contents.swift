import UIKit

// *************************************************************
// 1. Написать функцию, которая определяет, четное число или нет

let number1 = 234234

func checkIfEvenNumber(_ number: Int) {
    if number1 % 2 == 0 {
        print("1. The number \(number1) is even \n")
    } else {
        print("1. The number \(number1) isn't even \n")
    }
}
checkIfEvenNumber(number1)




// **************************************************************************
// 2. Написать функцию, которая определяет, делится ли число без остатка на 3

let number2 = 999

func checkIfNumberCanBeDividedByThree(_ number: Int) {
    if number % 3 == 0 {
        print("2. The number \(number2) can be divided by three \n")
    } else {
        print("2. The number \(number2) cannot be divided by three \n")
    }
}

checkIfNumberCanBeDividedByThree(number2)



// *******************************************
// 3. Создать возрастающий массив из 100 чисел
// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3

var ascendingArray = [Int]()

func createArrayOf100Elements() {
    for member in 1...100 {
        ascendingArray.append(member)
    }
}

func deletingNumbersWhichCannotBeDividedBy3() {
    var tempArray = [Int]()
    for desiredItem in 0..<ascendingArray.count {
        if ascendingArray[desiredItem] % 3 == 0 {
            if ascendingArray[desiredItem] % 2 != 0 {
                tempArray.append(ascendingArray[desiredItem])
            }
        }
    }
    ascendingArray = tempArray
    
}

createArrayOf100Elements()
print("3. The ascending Array is: \(ascendingArray) \n")

deletingNumbersWhichCannotBeDividedBy3()
print("4. The ascending Array without numbers which could be divided by 3 and aren't even is: \(ascendingArray) \n")




// ****************************************************************************************************************
// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов

var arrayOfNumbersFibonacci = [0, 1]
let definedArraySizeBy50Elements = 47 // Массив должен состоять из 50-ти элементов. 2 элемента уже присутствуют, а также нумерация массива с 0-ля, поэтому 47.

func appendingNewFibonacciNumber() {
    repeat {
        let numberOfItemsInArray = arrayOfNumbersFibonacci.count
        arrayOfNumbersFibonacci.append(arrayOfNumbersFibonacci[numberOfItemsInArray - 1] + arrayOfNumbersFibonacci[numberOfItemsInArray - 2])
    } while arrayOfNumbersFibonacci.count <= definedArraySizeBy50Elements
    print("5. The array of Fibonacci numbers, which consists of 50 items is: \(arrayOfNumbersFibonacci) \n")
}
appendingNewFibonacciNumber()




// ******************************************************************
// 6. * Заполнить массив из 100 элементов различными простыми числами

// Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:

// a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
// b. Пусть переменная p изначально равна двум — первому простому числу.
// c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
// d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
// e. Повторять шаги c и d, пока возможно.


// Уважаемый Амир, я решил реализовать данную задачу своим методом, так как по-моему в описании метода решения задачи допущена некая неточность касательно числа p, либо я что-то не так понял. Ничего личного

var arrayOfSimpleNumbers = [2]
let maxNumberOfItemsInsideArray = 100

func searchingForSimpleNumbers() {
    var flag = 0
    
    for number in 3...1000 {
        for divider in 2..<number {
            if number % divider == 0 {
                flag += 1
            }
        }
        if flag == 0 {
            if arrayOfSimpleNumbers.count < maxNumberOfItemsInsideArray {      // Условие, при котором должно быть 100 элементов из простых чисел
                arrayOfSimpleNumbers.append(number)
            }
        }
        flag = 0
    }
    
    print("6. The Array of simple numbers is: \(arrayOfSimpleNumbers) \n\n Array consists of \(arrayOfSimpleNumbers.count) simple numbers")
}
searchingForSimpleNumbers()
