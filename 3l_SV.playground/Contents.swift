import UIKit

enum EngineState: String {
    case start = "Заведен"
    case stop = "Заглушен"
}

enum WindowState: String {
    case open = "Открыты"
    case close = "Закрыты"
}

enum CarAction {
    case startEngine
    case stopEngine
    case windowOpen
    case windowClose
    case submergeTrunk
    case unload
}

struct SportCar {
    let marka: String
    let year: Int
    let capacityTrunk: Int
    var engine: EngineState
    var window: WindowState
    var filledTrunk: Int
    
    init(marka: String, capacityTrunk: Int) {
        self.marka = marka
        year = 2021
        self.capacityTrunk = capacityTrunk
        engine = .stop
        window = .close
        filledTrunk = 0
    }
    
    init(marka: String, year: Int, capacityTrunk: Int, engine: EngineState, window: WindowState, filledTrunk: Int) {
        self.marka = marka
        self.year = year
        self.capacityTrunk = capacityTrunk
        self.engine = engine
        self.window = window
        self.filledTrunk = filledTrunk
    }
    
    mutating func action(to value: CarAction) {
        switch value {
        case .startEngine:
            self.engine = .start
        case .stopEngine:
            self.engine = .stop
        case .windowOpen:
            self.window = .open
        case .windowClose:
            self.window = .close
        case .submergeTrunk:
            filledTrunk = filledTrunk + 10
        case .unload:
            filledTrunk = filledTrunk - 10
        }
    }
    
    func printCar() {
        print("=============================")
        print("Марка авто:", marka)
        print("Год выпуска:", year)
        print("Вместимость багажника:", capacityTrunk)
        print("Заполненность багажника:", filledTrunk)
        print("Состояние двигателя:", engine.rawValue)
        print("Состояние окон:", window.rawValue)
        
    }
}

struct TrunkCar {
    let marka: String
    let year: Int
    let capacityTrunk: Int
    var engine: EngineState
    var window: WindowState
    var filledTrunk: Int
    
    init(marka: String, year: Int, capacityTrunk: Int, engine: EngineState, window: WindowState, filledTrunk: Int) {
        self.marka = marka
        self.year = year
        self.capacityTrunk = capacityTrunk
        self.engine = engine
        self.window = window
        self.filledTrunk = filledTrunk
    }
    
    init(year: Int, window: WindowState) {
        marka = "Volvo"
        self.year = year
        capacityTrunk = 3000
        engine = .stop
        self.window = window
        filledTrunk = 0
    }
    
    mutating func action(to value: CarAction) {
        switch value {
        case .startEngine:
            self.engine = .start
        case .stopEngine:
            self.engine = .stop
        case .windowOpen:
            self.window = .open
        case .windowClose:
            self.window = .close
        case .submergeTrunk:
            filledTrunk = filledTrunk + 100
        case .unload:
            filledTrunk = filledTrunk - 100
        }
    }
    
    func printCar() {
        print("=============================")
        print("Марка авто:", marka)
        print("Год выпуска:", year)
        print("Вместимость багажника:", capacityTrunk)
        print("Заполненность багажника:", filledTrunk)
        print("Состояние двигателя:", engine.rawValue)
        print("Состояние окон:", window.rawValue)
        
    }
}


var car1 = SportCar(marka: "BMW", year: 2020, capacityTrunk: 80, engine: .stop, window: .close, filledTrunk: 0)
car1.action(to: .startEngine)
car1.action(to: .windowOpen)
car1.action(to: .submergeTrunk)
car1.action(to: .submergeTrunk)
car1.printCar()
car1.action(to: .unload)
car1.action(to: .stopEngine)
car1.action(to: .windowClose)
car1.printCar()

var car2 = SportCar(marka: "Toyota", year: 2021, capacityTrunk: 50, engine: .start, window: .open, filledTrunk: 10)
car2.action(to: .stopEngine)
car2.action(to: .windowClose)
car2.action(to: .submergeTrunk)
car2.printCar()


var car3 = TrunkCar(marka: "Kamaz", year: 2010, capacityTrunk: 2000, engine: .stop, window: .close, filledTrunk: 0)
car3.action(to: .submergeTrunk)
car3.action(to: .startEngine)
car3.action(to: .windowOpen)
car3.printCar()

var car4 = SportCar(marka: "Nissan", capacityTrunk: 700)
car4.action(to: .submergeTrunk)
car4.printCar()

var car5 = TrunkCar(year: 2000, window: .open)
car5.action(to: .startEngine)
car5.printCar()
