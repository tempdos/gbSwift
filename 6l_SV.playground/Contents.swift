import UIKit


enum CheckEngine: String {
    case start = "заведен"
    case stop = "заглушен"
}


enum CheckDoor: String {
    case open = "открыты"
    case close = "закрыты"
}

class Car {
    let engine: CheckEngine
    let door: CheckDoor
    let year: Int
    
    init(engine: CheckEngine, door: CheckDoor, year: Int) {
        self.engine = engine
        self.door = door
        self.year = year
    }
}


extension Car: CustomStringConvertible {
    var description: String {
        """
        Состояние автомобиля
        год: \(year)
        двигатель: \(engine.rawValue)
        двери: \(door.rawValue)
        -----------------------------
        """
    }
}


struct Queue<T> {
    private var elements: [T] = []
    
    func filter(predicate: (T) -> Bool) -> [T] {
        var returnArray: [T] = []
        for element in elements {
            if predicate(element) {
                returnArray.append(element)
            }
        }
        return returnArray
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        guard elements.count > 0 else {
            return nil
        }
        
        return elements.removeFirst()
    }
}

extension Queue {
    subscript(index: Int) -> T? {
        guard index >= 0 && index < elements.count else {
            return nil
        }
        return elements[index]
    }
}

var cars = Queue<Car>()
cars.push(Car(engine: .start, door: .open, year: 2021))
cars.push(Car(engine: .stop, door: .close, year: 2020))
cars.push(Car(engine: .start, door: .close, year: 2019))

var filterCars = cars.filter() { element in element.year > 2019 }
filterCars.forEach { print($0) }

cars[3]
