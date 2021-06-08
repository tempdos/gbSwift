import UIKit

enum EngineState: String {
    case start = "Заведен"
    case stop = "Заглушен"
}

enum WindowState: String {
    case open = "Открыты"
    case close = "Закрыты"
}

protocol Car: AnyObject {
    var marka: String { get }
    var year: Int { get }
    var capacityTrunk: Int { get }
    var engine: EngineState { get set }
    var window: WindowState { get set }
    var filledTrunk: Int { get set }
    
    func changeWindowState(window: WindowState)
    
    func changeEngineState(engine: EngineState)
    
    func submergeTrunk()
    
    func unload()
    
    func printCar() -> String
}

extension Car {
    func changeWindowState(window: WindowState) {
        self.window = window
    }
    
    func changeEngineState(engine: EngineState) {
        self.engine = engine
    }
    
    func printCar() -> String {
        return("""
        =============================
        Марка авто: \(marka)
        Год выпуска: \(year)
        Вместимость багажника: \(capacityTrunk)
        Заполненность багажника: \(filledTrunk)
        Состояние двигателя: \(engine.rawValue)
        Состояние окон: \(window.rawValue)
        """)
    }
}

class SportCar: Car {
    
    var marka: String
    var year: Int
    var capacityTrunk: Int
    var engine: EngineState
    var window: WindowState
    var filledTrunk: Int
    var roof: Bool
    
    init(marka: String, year: Int, capacityTrunk: Int, engine: EngineState, window: WindowState, filledTrunk: Int, roof: Bool) {
        self.marka = marka
        self.year = year
        self.capacityTrunk = capacityTrunk
        self.engine = engine
        self.window = window
        self.filledTrunk = filledTrunk
        self.roof = roof
    }
    
    init(marka: String, capacityTrunk: Int, roof: Bool) {
        self.roof = roof
        self.marka = marka
        self.year = 2021
        self.capacityTrunk = capacityTrunk
        self.engine = .stop
        self.window = .close
        self.filledTrunk = 0
    }
    
    func submergeTrunk() {
        self.filledTrunk += 10
    }
    
    func unload() {
        self.filledTrunk -= 10
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        let addRoof = roof ? "открыта" : "закрыта"
        return printCar()+"\n"+"Крыша: "+addRoof
    }
}

class TrunkCar: Car {
    
    var marka: String
    var year: Int
    var capacityTrunk: Int
    var engine: EngineState
    var window: WindowState
    var filledTrunk: Int
    var trailer: Bool
    
    init(marka: String, year: Int, capacityTrunk: Int, engine: EngineState, window: WindowState, filledTrunk: Int, trailer: Bool) {
        self.marka = marka
        self.year = year
        self.capacityTrunk = capacityTrunk
        self.engine = engine
        self.window = window
        self.filledTrunk = filledTrunk
        self.trailer = trailer
    }
    
    init(year: Int, window: WindowState, trailer: Bool) {
        self.marka = "Volvo"
        self.year = year
        self.capacityTrunk = 3000
        self.engine = .stop
        self.window = window
        self.filledTrunk = 0
        self.trailer = trailer
    }
    
    func submergeTrunk() {
        self.filledTrunk += 100
    }
    
    func unload() {
        self.filledTrunk -= 100
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        
        let addTrailer = trailer ? "зацеплен" : "отцеплен"
        let print = printCar()+"\n"+"Прицеп: "+addTrailer
        return print
    }
}


var car1 = SportCar(marka: "BMW", year: 2020, capacityTrunk: 80, engine: .stop, window: .close, filledTrunk: 0, roof: true)
car1.printCar()
car1.changeWindowState(window: .open)
car1.changeEngineState(engine: .start)
car1.submergeTrunk()
car1.unload()
print(car1)

var car2 = SportCar(marka: "Toyota", year: 2021, capacityTrunk: 50, engine: .start, window: .open, filledTrunk: 10, roof: false)
print(car2)


var car3 = TrunkCar(marka: "Kamaz", year: 2010, capacityTrunk: 2000, engine: .stop, window: .close, filledTrunk: 0, trailer: false)
car3.submergeTrunk()
print(car3)
car3.changeEngineState(engine: .start)
car3.changeWindowState(window: .open)
car3.unload()
print(car3)

var car4 = SportCar(marka: "Nissan", capacityTrunk: 700, roof: false)
car4.submergeTrunk()
print(car4)

var car5 = TrunkCar(year: 2000, window: .open, trailer: true)
car5.changeEngineState(engine: .start)
car5.submergeTrunk()
print(car5)
