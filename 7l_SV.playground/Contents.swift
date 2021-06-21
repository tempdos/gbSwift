import UIKit

struct Car {
    let name: String
    let weight: Double
}

struct Place {
    var price: Int
    var count: Int
    let car: Car
}

class Ferry {
    var places = [
        "Truck": Place(price: 2000, count: 1, car: Car(name: "Trunk", weight: 7.5)),
        "Sedan": Place(price: 500, count: 1, car: Car(name: "Sedan", weight: 1.2)),
        "SUV": Place(price: 750, count: 1, car: Car(name: "SUV", weight: 2.5)),
        "Minivan": Place(price: 1000, count: 1, car: Car(name: "Minivan", weight: 1.8))
    ]

    var cash: Int = 0

    func shipment(carNamed name: String) -> Car? {
        guard let place = places[name] else { return nil }
        guard cash >= place.price else { return nil }
        guard place.count > 0 else { return nil }

        cash -= place.price

        var newCar = place
        newCar.count -= 1
        places[name] = newCar

        return place.car
    }
}

let parom = Ferry()

enum FerryError: Error {

    case fullFerry
    case noCash(cashNeeded: Int)
    case noSelectionCar

    var localizedDescription: String {
        switch self {
        case .fullFerry:
            return "Паром заполнен данным типом авто"
        case .noSelectionCar:
            return "Паром не перевозит такой тип авто"
        case .noCash(cashNeeded: let cashNeeded):
            return "Недостаточно средств: \(cashNeeded)"
        }
    }
}


extension Ferry {
    func shipmentWithError(carNamed name: String) -> (place: Car?, error: FerryError?) {
        guard let place = places[name] else {
            return (place: nil, error: .noSelectionCar)
        }
        guard cash >= place.price else {
            return (place: nil, error: .noCash(cashNeeded: place.price - cash))

        }
        guard place.count > 0 else {
            return (place: nil, error: .fullFerry)
        }

        cash -= place.price

        var newPlace = place
        newPlace.count -= 1
        places[name] = newPlace

        return (place: place.car, error: nil)
    }
}

parom.cash = 1000

let car1 = parom.shipmentWithError(carNamed: "Sedan")
if let place = car1.place {
    print("\(place.name) заехал в паром")
} else if let error = car1.error {
    print("\(error.localizedDescription)")
}

let car2 = parom.shipmentWithError(carNamed: "Sedan")
if let place = car2.place {
    print("\(place.name) заехал в паром")
} else if let error = car2.error {
    print("\(error.localizedDescription)")
}

let car3 = parom.shipmentWithError(carNamed: "VAN")
if let place = car3.place {
    print("\(place.name) заехал в паром")
} else if let error = car3.error {
    print("\(error.localizedDescription)")
}

let car4 = parom.shipmentWithError(carNamed: "SUV")
if let place = car4.place {
    print("\(place.name) заехал в паром")
} else if let error = car4.error {
    print("\(error.localizedDescription)")
}


extension Ferry {
    func shipmentWithThrowError(carNamed name: String) throws -> Car {
        guard let place = places[name] else {
            throw FerryError.noSelectionCar
        }
        guard cash >= place.price else {
            throw FerryError.noCash(cashNeeded: place.price - cash)
        }
        guard place.count > 0 else {
            throw FerryError.fullFerry
        }

        cash -= place.price

        var newPlace = place
        newPlace.count -= 1
        places[name] = newPlace

        return place.car
    }
}

do {
    let place = try parom.shipmentWithThrowError(carNamed: "Sedan")
    print("\(place.name) заехал в паром")
} catch FerryError.noSelectionCar {
    print("Паром не перевозит такой тип авто")
} catch FerryError.fullFerry {
    print("Паром заполнен данным типом авто")
} catch FerryError.noCash(cashNeeded: let cashNeeded) {
    print("Недостаточно средств: \(cashNeeded)")
}
