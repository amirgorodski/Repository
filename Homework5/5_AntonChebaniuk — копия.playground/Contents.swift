import UIKit

/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 3. Создать два класса, имплементирующих протокол «Car»: tunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 4. Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести сами объекты в консоль.
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

enum Windows {
    case isOpen, isClosed
}

enum Doors {
    case isOpen, isClosed
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

// Interface of "Car"

protocol CarProperties: CustomStringConvertible {
    var color: UIColor { get }
    var transmission: Transmission { get }
    var numberOfWheels: NumberOfWheels { get }
    var engineState: EngineState { get }
    var km: Double { get }
    var miles: Double { get set }
    var cruiseControl: CruiseControl { get }
    var windows: Windows { get set }
    var doors: Doors { get set }
    
    func changeEngineState() -> String
    func RideSomeLengthByKM(lengthInKM: Double)
    func switchCruiseControl() -> String
    func printDescription()
}

// Description of Extension for interface "Car"

extension CarProperties {
    mutating func windowsOperations() -> String {
        if windows == .isClosed {
            windows = .isOpen
        } else if windows == .isOpen {
            windows = .isClosed
        }
        return "Windows status: \(windows)"
    }
    mutating func doorsOperations() -> String {
        if doors == .isClosed {
            doors = .isOpen
        } else if doors == .isOpen {
            doors = .isClosed
        }
        return "Doors status: \(doors)"
    }
}

// Description of class "SuperCar"

class SuperCar: CarProperties {
        
    var color: UIColor
    
    var transmission: Transmission
    
    var numberOfWheels: NumberOfWheels
    
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
    
    var windows: Windows
    
    var doors: Doors
    
    var carSpoiler: CarSpoiler
    
    var description: String {
        return String(describing: "Color: \(color), Transmission: \(transmission), Number of wheels: \(numberOfWheels), Engine: \(engineState), Mileage: \(km) km, \(miles) miles, Cruise Control: \(cruiseControl), Windows: \(windows), Doors: \(doors), Car spoiler: \(carSpoiler)")
    }
    
    init(color: UIColor, transmission: Transmission, numberOfWheels: NumberOfWheels, engineState: EngineState, km: Double, cruiseControl: CruiseControl, windows: Windows, doors: Doors, carSpoiler: CarSpoiler) {
        self.color = color
        self.transmission = transmission
        self.numberOfWheels = numberOfWheels
        self.engineState = engineState
        self.km = km
        self.cruiseControl = cruiseControl
        self.windows = windows
        self.doors = doors
        self.carSpoiler = carSpoiler
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

extension SuperCar {
    func setSpoiler() -> String {
        if carSpoiler == .isSet {
            carSpoiler = .isNotSet
        } else if carSpoiler == .isNotSet {
            carSpoiler = .isSet
        }
        return "Car Spoiler was changed to: \(carSpoiler)"
    }
    func printDescription() {
        print(description)
    }
}

// Description of class "TrunkCar"

class TrunkCar: CarProperties {
        
    var color: UIColor
    
    var transmission: Transmission
    
    var numberOfWheels: NumberOfWheels
    
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
    
    var windows: Windows
    
    var doors: Doors
    
    var trailerConnection: TrailerConnection
    
    var description: String {
        return String(describing: "Color: \(color), Transmission: \(transmission), Number of wheels: \(numberOfWheels), Engine: \(engineState), Mileage: \(km) km, \(miles) miles, Cruise Control: \(cruiseControl), Windows: \(windows), Doors: \(doors), Trailer connection: \(trailerConnection)")
    }
    
    init(color: UIColor, transmission: Transmission, numberOfWheels: NumberOfWheels, engineState: EngineState, km: Double, cruiseControl: CruiseControl, windows: Windows, doors: Doors, trailerConnection: TrailerConnection) {
        self.color = color
        self.transmission = transmission
        self.numberOfWheels = numberOfWheels
        self.engineState = engineState
        self.km = km
        self.cruiseControl = cruiseControl
        self.windows = windows
        self.doors = doors
        self.trailerConnection = trailerConnection
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

extension TrunkCar {
    func connectTrailer() -> String {
        if trailerConnection == .isConnected {
            trailerConnection = .isDisconnected
        } else if trailerConnection == .isDisconnected {
            trailerConnection = .isConnected
        }
        return "Trailer status: \(trailerConnection)"
    }
    func printDescription() {
        print(description)
    }
}

// Console commands

let lamborghiniAventador = SuperCar(color: .orange, transmission: .auto, numberOfWheels: .four, engineState: .isOff, km: 0, cruiseControl: .isOff, windows: .isClosed, doors: .isClosed, carSpoiler: .isSet)

lamborghiniAventador.printDescription()
lamborghiniAventador.RideSomeLengthByKM(lengthInKM: 4)
lamborghiniAventador.changeEngineState()
lamborghiniAventador.RideSomeLengthByKM(lengthInKM: 50)
lamborghiniAventador.printDescription()
