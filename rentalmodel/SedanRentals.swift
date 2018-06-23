//
//  SedanRentals.swift
//  CarRentalBilling
//
//  Created by Sayed Abdo on 6/5/18.
//  Copyright © 2018 Ameer Gaafar. All rights reserved.
//

import Foundation
class SedanRental: Rental{
    
    override init(vehicle: Vehicle, mileage: Int, daysRented: Int, lateFee: Bool) {
        super.init(vehicle: vehicle, mileage: mileage, daysRented: daysRented, lateFee: lateFee)
    }
    
    override func getAmount() -> Double {
        thisAmount=50.0
        thisAmount += Double(100*self.daysRented)
        if self.kilometersRented > self.daysRented*50
        {
            thisAmount += Double((self.kilometersRented - self.daysRented*50) * 2)
        }
        if self.lateFee {
            thisAmount+=thisAmount*0.03;
        }
        return thisAmount
    }
    
    override func getReward() -> Int {
        return rewardPoints
    }
}
