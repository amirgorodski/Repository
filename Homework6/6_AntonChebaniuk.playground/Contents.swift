import UIKit

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример:
 filter для массивов)
 3. *Добавить свой subscript, который будет возвращать nil в случае обращения к
 несуществующему индексу.
 */

// В качестве модели для домашнего задания была выбрана взлётная полоса (очередь) и самолёты с конкретными характеристиками (из которых состоит очередь)

enum AircraftType {
    case passenger, cargo
}

enum EngineType {
    case standard, power, superPower
}

enum MaxSpeed: Int {
    case standardSpeed = 900
    case powerSpeed = 1500
    case superPowerSpeed = 3000
}

enum FuselageSize {
    case small, middle, big
}

enum TimeToTakeOff: Int {
    case standardTime = 20
    case powerTime = 15
    case superPowerTime = 10
}

protocol AircraftProperties: CustomStringConvertible {
    var aircraftType: AircraftType { get }
    var engineType: EngineType { get }
    var maxSpeed: MaxSpeed { get }
    var fuselageSize: FuselageSize { get }
    var routeLength: Int { get }
    
    func printDescription()
}

protocol Takeoff {
    var flightNumber: Int { get }
    var timeToTakeOff: TimeToTakeOff { get }
}

extension Takeoff {
    func showQueueTakeoffTime() {
        print("Total weight of all queue of aircrafts is: \(timeToTakeOff.rawValue)")
    }
}

class CargoAirplane: AircraftProperties, Takeoff, CustomStringConvertible {
    var flightNumber: Int
    var aircraftType: AircraftType
    var engineType: EngineType
    var maxSpeed: MaxSpeed { // Максимальная скорость определяется типом двигателя
        get {
            switch engineType {
            case .standard:
                return .standardSpeed
            case .power:
                return .powerSpeed
            case .superPower:
                return .superPowerSpeed
            }
        }
    }
    var fuselageSize: FuselageSize { // Размер фюзеляжа зависит от подъёмной мощности двигателя
        get {
            switch engineType {
            case .standard:
                return .small
            case .power:
                return .middle
            case .superPower:
                return .big
            }
        }
    }
    var routeLength: Int = 0
    var timeToTakeOff: TimeToTakeOff { // Время взлёта зависит от мощности двигателя (чем мощнее – тем меньше времени требуется для взлёта)
        get {
            switch engineType {
            case .standard:
                return .standardTime
            case .power:
                return .powerTime
            case .superPower:
                return .superPowerTime
            }
        }
    }
    var description: String {
        return String(describing: "Flight number: \(flightNumber), Aircraft type: \(aircraftType), Engine type: \(engineType), Maximum speed: \(maxSpeed), Fuselage size: \(fuselageSize), Time to take off: \(timeToTakeOff.rawValue)")
    }
    
    func flightTimeCalculator(maxSpeed: Int, routeLength: Int) -> Int {
        return maxSpeed * routeLength
    }
    
    func printDescription() {
        print(description)
    }
    
    init(flightNumber: Int, aircraftType: AircraftType, engineType: EngineType) {
        self.flightNumber = flightNumber
        self.aircraftType = aircraftType
        self.engineType = engineType
    }
}

class PassengerAircraft: AircraftProperties, Takeoff, CustomStringConvertible {
    var flightNumber: Int
    var aircraftType: AircraftType
    var engineType: EngineType
    var maxSpeed: MaxSpeed {
        get {
            switch engineType {
            case .standard:
                return .standardSpeed
            case .power:
                return .powerSpeed
            case .superPower:
                return .superPowerSpeed
            }
        }
    }
    var fuselageSize: FuselageSize {
        get {
            switch engineType {
            case .standard:
                return .small
            case .power:
                return .middle
            case .superPower:
                return .big
            }
        }
    }
    var routeLength: Int = 0
    var timeToTakeOff: TimeToTakeOff {
        get {
            switch engineType {
            case .standard:
                return .standardTime
            case .power:
                return .powerTime
            case .superPower:
                return .superPowerTime
            }
        }
    }
    var description: String {
        return String(describing: "Flight number: \(flightNumber), Aircraft type: \(aircraftType), Engine type: \(engineType), Maximum speed: \(maxSpeed), Fuselage size: \(fuselageSize), Time to take off: \(timeToTakeOff.rawValue)")
    }
    func flightTimeCalculator(maxSpeed: Int, routeLength: Int) -> Int {
        return maxSpeed * routeLength
    }
    
    func printDescription() {
        print(description)
    }
    
    init(flightNumber: Int, aircraftType: AircraftType, engineType: EngineType) {
        self.flightNumber = flightNumber
        self.aircraftType = aircraftType
        self.engineType = engineType
    }
    
    let evenNumbersCheck: (Int) -> Bool = { (flightNumber: Int) -> Bool in
        return flightNumber % 2 != 0
    }
}

extension PassengerAircraft {
    func removeEvenNumberFlights(flighs: [PassengerAircraft], evenNumbersCheck: (Int) -> Bool) -> [PassengerAircraft] {
        var onlyOddNumbersOfFlights = [PassengerAircraft]()
        for flight in flighs {
            if evenNumbersCheck(flight.flightNumber) {
                onlyOddNumbersOfFlights.append(flight)
            }
        }
        return onlyOddNumbersOfFlights
    }
}

// Дженерик структура, создание очереди самолётов на взлётной полосе
struct Queue<Flight: Takeoff> {
    var flights: [Flight] = []
    
    mutating func addAircraftToQueue(flight: Flight) {
        flights.append(flight)
        print("Flight #\(flight.flightNumber) is added to Queue")
    }
    mutating func takeoff() -> Flight? {
        if flights .isEmpty {
            print("There're no aircrafts in the queue to start flight")
            return nil
        } else {
            print("First aircraft #\(flights[0].flightNumber) has took off")
            return flights.removeFirst()
        }
    }
    var totalTimeToTakeOff: Int {
        var timeToTakeOff = 0
        for aircraft in flights {
            timeToTakeOff += aircraft.timeToTakeOff.rawValue
        }
        return timeToTakeOff
    }
    // Замыкание
    let evenNumbersCheck: (Int) -> Bool = { (flightNumber: Int) -> Bool in
        return flightNumber % 2 != 0
    }
    // Функция высшего порядка с замыканием, описание
    func removeEvenNumberFlights(evenNumbersCheck: (Int) -> Bool) -> [Flight] {
        var onlyOddNumbersOfFlights = [Flight]()
        for flight in flights {
            if evenNumbersCheck(flight.flightNumber) {
                onlyOddNumbersOfFlights.append(flight)
            }
        }
        return onlyOddNumbersOfFlights
    }
    
    // Сабскрипт
    subscript(member: Int) -> Any? {
        if member > flights.count {
            return nil
        } else {
            return member
        }
    }
}

var passengerAircraftsQueue = Queue<PassengerAircraft>()
var cargoAircraftsQueue = Queue<CargoAirplane>()

// Добавляем элементы в массив: очередь самолётов на взлёт
passengerAircraftsQueue.addAircraftToQueue(flight: PassengerAircraft(flightNumber: 1200, aircraftType: .passenger, engineType: .standard))
passengerAircraftsQueue.addAircraftToQueue(flight: PassengerAircraft(flightNumber: 1201, aircraftType: .passenger, engineType: .standard))
passengerAircraftsQueue.addAircraftToQueue(flight: PassengerAircraft(flightNumber: 1202, aircraftType: .passenger, engineType: .standard))
passengerAircraftsQueue.addAircraftToQueue(flight: PassengerAircraft(flightNumber: 1203, aircraftType: .passenger, engineType: .power))
passengerAircraftsQueue.addAircraftToQueue(flight: PassengerAircraft(flightNumber: 1204, aircraftType: .passenger, engineType: .superPower))
passengerAircraftsQueue.addAircraftToQueue(flight: PassengerAircraft(flightNumber: 1205, aircraftType: .passenger, engineType: .superPower))
passengerAircraftsQueue.addAircraftToQueue(flight: PassengerAircraft(flightNumber: 1206, aircraftType: .passenger, engineType: .superPower))
passengerAircraftsQueue.addAircraftToQueue(flight: PassengerAircraft(flightNumber: 1207, aircraftType: .passenger, engineType: .power))
passengerAircraftsQueue.addAircraftToQueue(flight: PassengerAircraft(flightNumber: 1208, aircraftType: .passenger, engineType: .power))

// Функция высшего порядка с замыканием в действии
var onlyOddFlights = passengerAircraftsQueue.removeEvenNumberFlights(evenNumbersCheck: passengerAircraftsQueue.evenNumbersCheck)
print("Only oddflight numbers are:")
for flight in onlyOddFlights {
    print(flight)
}

// Вынимаем первый элемент очереди: взлёт первого самолёта в очереди
passengerAircraftsQueue.takeoff()
passengerAircraftsQueue.takeoff()

// Работа сабскрипта
print(passengerAircraftsQueue[10])
