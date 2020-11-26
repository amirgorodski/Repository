import UIKit

/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 2. Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.
 */

// Enumerating car properties

enum Transmission {
    case manual, auto
    
}

enum NumberOfWheels {
    case four, six
}

enum EngineState {
    case isOn, isOff
}

enum CruiseControl {
    case isOn, isOff
}

// Specified SuperCar properties

enum SportCruiseControl {
    case isNormal, isTurbo
}

enum CarSpoiler {
    case isSet, isNotSet
}

// Specified TrunkCar properties

enum TrailerConnection {
    case isConnected, isDisconnected
}

// Description of class "Car"

class Car {
    let color: UIColor
    let transmission: Transmission
    let numberOfWheels: NumberOfWheels
    var engineState: EngineState {
        willSet {
            if newValue == .isOn {
                print("The Engine is starting. Let it warm up")
            } else {
                print("The Engine has stoped. Now you can unfasten and go out from car")
            }
        }
    }
    var km: Double {
        didSet {
            print("Covered \(self.km) kilometers")
        }
    }
    var cruiseControl: CruiseControl
    var miles: Double {
        get {
            km / 1.6
        }
        set {
            miles * 1.6
        }
    }
    
    init(color: UIColor, transmission: Transmission, numberOfWheels: NumberOfWheels, engineState: EngineState, km: Double, cruiseControl: CruiseControl) {
        self.color = color
        self.transmission = transmission
        self.numberOfWheels = numberOfWheels
        self.engineState = engineState
        self.km = km
        self.cruiseControl = cruiseControl
    }
    
    func changeEngineState() -> String {
        if engineState == .isOff {
            engineState = .isOn
        } else if engineState == .isOn {
            engineState = .isOff
        }
        return "Engin state was changed to: \(engineState)"
    }
    
    func RideSomeLengthByKM(lengthInKM: Double) {
        if engineState == .isOn {
            if lengthInKM > 0 {
                km += lengthInKM
                print("Total mileage is: \(km)")
            } else if lengthInKM == 0 {
                print("We won't go anywhere")
            } else {
                print("Wrong type of length")
            }
        } else {
            print("To ride you should turn your Engine on")
        }
    }
    
    func switchCruiseControl() -> String {
        if cruiseControl == .isOff {
            cruiseControl = .isOn
        } else if cruiseControl == .isOn {
            cruiseControl = .isOff
        }
        return "Cruise Control was switched to: \(cruiseControl)"
    }
}

// Description of hair class "SuperCar"

class SuperCar: Car {
    var carSpoiler: CarSpoiler
    
    init(color: UIColor, transmission: Transmission, numberOfWheels: NumberOfWheels, engineState: EngineState, km: Double, cruiseControl: CruiseControl, carSpoiler: CarSpoiler) {
        self.carSpoiler = carSpoiler
        
        super.init(color: color, transmission: transmission, numberOfWheels: numberOfWheels, engineState: engineState, km: km, cruiseControl: cruiseControl)
    }
    
    func setSpoiler() -> String {
        if carSpoiler == .isSet {
            carSpoiler = .isNotSet
        } else if carSpoiler == .isNotSet {
            carSpoiler = .isSet
        }
        return "Car Spoiler was changed to: \(carSpoiler)"
    }
    override func switchCruiseControl() -> String {
        super.switchCruiseControl()
        return "Mode of Cruise Control for Super Cars is on"
    }
}

// Description of hair class "TrunkCar"

class TrunkCar: Car {
    var trailerConnection: TrailerConnection
    
    init(color: UIColor, transmission: Transmission, numberOfWheels: NumberOfWheels, engineState: EngineState, km: Double, cruiseControl: CruiseControl, trailerConnection: TrailerConnection) {
        self.trailerConnection = trailerConnection
        
        super.init(color: color, transmission: transmission, numberOfWheels: numberOfWheels, engineState: engineState, km: km, cruiseControl: cruiseControl)
    }
    
    func connectTrailer() -> String {
        if trailerConnection == .isConnected {
            trailerConnection = .isDisconnected
        } else if trailerConnection == .isDisconnected {
            trailerConnection = .isConnected
        }
        return "Trailer status: \(trailerConnection)"
    }
    override func switchCruiseControl() -> String {
        super.switchCruiseControl()
        return "Mode of Cruise Control for Trunk Cars is on"
    }
}

let lamborghiniGallardo = SuperCar(color: .yellow, transmission: .auto, numberOfWheels: .four, engineState: .isOff, km: 0, cruiseControl: .isOff, carSpoiler: .isNotSet)
print(lamborghiniGallardo.setSpoiler())
print(lamborghiniGallardo.switchCruiseControl())
lamborghiniGallardo.RideSomeLengthByKM(lengthInKM: 40)
lamborghiniGallardo.changeEngineState()
lamborghiniGallardo.RideSomeLengthByKM(lengthInKM: 40)
print("Total mileage in miles is \(lamborghiniGallardo.miles)")

let bugattiVeyron = SuperCar(color: .blue, transmission: .auto, numberOfWheels: .four, engineState: .isOff, km: 0, cruiseControl: .isOff, carSpoiler: .isSet)
bugattiVeyron.changeEngineState()
bugattiVeyron.RideSomeLengthByKM(lengthInKM: 0)


let kenworthT680E = TrunkCar(color: .white, transmission: .manual, numberOfWheels: .six, engineState: .isOff, km: 0, cruiseControl: .isOff, trailerConnection: .isDisconnected)
print(kenworthT680E.connectTrailer())
print(kenworthT680E.switchCruiseControl())
print(kenworthT680E.cruiseControl)
print(kenworthT680E.switchCruiseControl())
print(kenworthT680E.cruiseControl)

