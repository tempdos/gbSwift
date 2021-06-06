import UIKit

enum EngineState: String {
    case start = "Заведен"
    case stop = "Заглушен"
}

enum WindowState: String {
    case open = "Открыты"
    case close = "Закрыты"
}

class Car {
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
    
    func changeWindowState(window: WindowState) {
        self.window = window
    }
    
    func changeEngineState(engine: EngineState) {
        self.engine = engine
    }
    
    func submergeTrunk() {}
    
    func unload() {}
    
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

class SportCar: Car {
    var roof: Bool
    
    init(marka: String, year: Int, capacityTrunk: Int, engine: EngineState, window: WindowState, filledTrunk: Int, roof: Bool) {
        self.roof = roof
        super.init(marka: marka, year: year, capacityTrunk: capacityTrunk, engine: engine, window: window, filledTrunk: filledTrunk)
    }
    
    init(marka: String, capacityTrunk: Int, roof: Bool) {
        self.roof = roof
        super.init(marka: marka, year: 2021, capacityTrunk: capacityTrunk, engine: .stop, window: .close, filledTrunk: 0)
    }
    
    override func submergeTrunk() {
        super.filledTrunk += 10
    }
    
    override func unload() {
        super.filledTrunk -= 10
    }
    
    override func printCar() {
        super.printCar()
        print("Крыша:", roof ? "открыта" : "закрыта")
    }
}

class TrunkCar: Car {
    var trailer: Bool
    
    init(marka: String, year: Int, capacityTrunk: Int, engine: EngineState, window: WindowState, filledTrunk: Int, trailer: Bool) {
        self.trailer = trailer
        super.init(marka: marka, year: year, capacityTrunk: capacityTrunk, engine: engine, window: window, filledTrunk: filledTrunk)
    }
    
    init(year: Int, window: WindowState, trailer: Bool) {
        self.trailer = trailer
        super.init(marka: "Volvo", year: year, capacityTrunk: 3000, engine: .stop, window: window, filledTrunk: 0)
    }
    
    override func submergeTrunk() {
        super.filledTrunk += 100
    }
    
    override func unload() {
        super.filledTrunk -= 100
    }
    
    override func printCar() {
        super.printCar()
        print("Прицеп:", trailer ? "зацеплен" : "отцеплен")
    }
}


var car1 = SportCar(marka: "BMW", year: 2020, capacityTrunk: 80, engine: .stop, window: .close, filledTrunk: 0, roof: true)
car1.printCar()
car1.changeWindowState(window: .open)
car1.changeEngineState(engine: .start)
car1.submergeTrunk()
car1.unload()
car1.printCar()

var car2 = SportCar(marka: "Toyota", year: 2021, capacityTrunk: 50, engine: .start, window: .open, filledTrunk: 10, roof: false)
car2.printCar()


var car3 = TrunkCar(marka: "Kamaz", year: 2010, capacityTrunk: 2000, engine: .stop, window: .close, filledTrunk: 0, trailer: false)
car3.submergeTrunk()
car3.printCar()
car3.changeEngineState(engine: .start)
car3.changeWindowState(window: .open)
car3.unload()
car3.printCar()

var car4 = SportCar(marka: "Nissan", capacityTrunk: 700, roof: false)
car4.submergeTrunk()
car4.printCar()

var car5 = TrunkCar(year: 2000, window: .open, trailer: true)
car5.changeEngineState(engine: .start)
car5.submergeTrunk()
car5.printCar()
