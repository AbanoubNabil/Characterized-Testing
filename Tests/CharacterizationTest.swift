
import XCTest

class CharacterizationTests: XCTestCase {
   
    func testTypicalOutput() {
        let blueBMW = Suv(color: "Blue", year: 2017, model: "X3")
        let greyJeep = FourXFour(color: "Grey", year: 2013, model: "Jeep")
        let blueHonda = Sedan(color: "Blue" , year: 2008 , model: "Honda" )
        let redSunny = Sedan(color: "Red" , year: 2014 , model: "Sunny" )
   
        let hondaRental = SedanRental(vehicle: blueHonda, mileage: 431, daysRented: 4, lateFee: false)
        let jeepRental = FourXFourRental(vehicle: greyJeep, mileage: 744, daysRented: 4, lateFee: false)
        let sunnnyRental = SedanRental(vehicle: redSunny, mileage: 591, daysRented: 3, lateFee: true)
        let x3Rental = SuvRental(vehicle: blueBMW, mileage: 240, daysRented: 5, lateFee: false)
        
        let VirginGates = Customer(name: "Virgin Gates")
        let SharmDreams = Customer(name: "Sharm Dreams")
        
        VirginGates.addRental(rental:hondaRental)
        VirginGates.addRental(rental:jeepRental)
        VirginGates.addRental(rental:sunnnyRental)
        
        SharmDreams.addRental(rental:x3Rental)
        
        XCTAssertEqual("Rental Record for:Virgin Gates\n\t\"Blue Honda 2008\"\tLE 912.00\n\t\"Grey Jeep 2013\"\tLE 850.00\n\t\"Red Sunny 2014\"\tLE 1268.96\nAmount owed is LE 3030.96\nYou earned: 4 new Reward Points\n\n", VirginGates.statement(type: .text))

        XCTAssertEqual("Rental Record for:Sharm Dreams\n\t\"Blue X3 2017\"\tLE 760.00\nAmount owed is LE 760.00\nYou earned: 1 new Reward Points\n\n", SharmDreams.statement(type: .text))
        
    }
    
}

