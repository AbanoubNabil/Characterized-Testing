import XCTest

class BillingTests: XCTestCase {

    let blueBMW = Suv(color: "Blue", year: 2017, model: "X3")
    let greyJeep = FourXFour(color: "Grey", year: 2013, model: "Jeep")
    let blueHonda = Sedan(color: "Blue" , year: 2008 , model: "Honda" )
    
    
    func testCarsInit() {
        XCTAssertEqual("Blue X3 2017",blueBMW.getVehicleData())
        XCTAssertEqual("Grey Jeep 2013",greyJeep.getVehicleData())
        XCTAssertEqual("Blue Honda 2008",blueHonda.getVehicleData())
    }
    
    func testSedanRentalAmountAndReward() {
        let hondaRental = SedanRental(vehicle: blueHonda, mileage: 10, daysRented: 4, lateFee: false)
        
        let amountNoLate = hondaRental.getAmount()
        let expectedAmountWithLate = amountNoLate + (amountNoLate*0.03)
        
        XCTAssertEqual(450.0,amountNoLate)
        hondaRental.lateFee = true
        XCTAssertEqual(expectedAmountWithLate , hondaRental.getAmount())
        XCTAssertEqual(1,hondaRental.getReward())
    }
    
    func testFourXFourRentalAmountAndReward() {
        let jeepRental = FourXFourRental(vehicle: greyJeep, mileage: 20, daysRented: 10, lateFee: false)
        
        let amountNoLate = jeepRental.getAmount()
        let expectedAmountWithLate = amountNoLate + (amountNoLate*0.03)
        let rewardNoLate = jeepRental.getReward()
        
        XCTAssertEqual(2050.0,amountNoLate)
        XCTAssertEqual(2,rewardNoLate)
        jeepRental.lateFee = true
        XCTAssertEqual(expectedAmountWithLate , jeepRental.getAmount())
        
    }
    
    func testSuvRentalAmountAndReward() {
        
        let x3Rental = SuvRental(vehicle: blueBMW, mileage: 240, daysRented: 5, lateFee: false)
        
        let amountNoLate = x3Rental.getAmount()
        let expectedAmountWithLate = amountNoLate + (amountNoLate*0.03)
        let rewardNoLate = x3Rental.getReward()
        
        XCTAssertEqual(760.0,amountNoLate)
        XCTAssertEqual(1,rewardNoLate)
        x3Rental.lateFee = true
        XCTAssertEqual(expectedAmountWithLate , x3Rental.getAmount())
    }
    
    func testCustomerTotalAmount() {
        
        let blueBMW = Suv(color: "Blue", year: 2017, model: "X3")
        let greyJeep = FourXFour(color: "Grey", year: 2013, model: "Jeep")
        let blueHonda = Sedan(color: "Blue" , year: 2008 , model: "Honda" )
        let redSunny = Sedan(color: "Red" , year: 2014 , model: "Sunny" )
        
        let hondaRental = SedanRental(vehicle: blueHonda, mileage: 0, daysRented: 0, lateFee: false)
        let jeepRental = FourXFourRental(vehicle: greyJeep, mileage: 1, daysRented: 4, lateFee: false)
        let sunnnyRental = SedanRental(vehicle: redSunny, mileage: 3, daysRented: 3, lateFee: true)
        let x3Rental = SuvRental(vehicle: blueBMW, mileage: 2, daysRented: 2, lateFee: false)
        
        
        let virginGates = Customer(name: "Virgin Gates")
        let sharmDreams = Customer(name: "Sharm Dreams")
        
        virginGates.addRental(rental:hondaRental)
        virginGates.addRental(rental:jeepRental)
        virginGates.addRental(rental:sunnnyRental)
        
        sharmDreams.addRental(rental:x3Rental)
        
        let totalRental = hondaRental.getAmount()+jeepRental.getAmount()+sunnnyRental.getAmount()
        XCTAssertEqual(totalRental , virginGates.getTotalAmount())
        XCTAssertEqual(1260.5 , virginGates.getTotalAmount())
        XCTAssertEqual(x3Rental.getAmount() , sharmDreams.getTotalAmount())
    }
    
    func testJsonOutput() {
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
        
        XCTAssertEqual("""
{
  "rewardPoints" : 4,
  "rentals" : [
    {
      "amount" : 3030.96,
      "model" : "Honda",
      "year" : 2008,
      "color" : "Blue"
    },
    {
      "amount" : 3030.96,
      "model" : "Jeep",
      "year" : 2013,
      "color" : "Grey"
    },
    {
      "amount" : 3030.96,
      "model" : "Sunny",
      "year" : 2014,
      "color" : "Red"
    }
  ],
  "name" : "Virgin Gates",
  "amountowned" : 3030.96
}
""", VirginGates.statement(type: .json))
    }
    
    
    func testPerformanceTxtStatment()  {
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
        
        measure {
           _ = VirginGates.statement(type: .text)
        }
    }
    
    
    func testPerformanceJsonStatment()  {
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
        
        measure {
            _ = VirginGates.statement(type: .json)
        }
    }
    
}
