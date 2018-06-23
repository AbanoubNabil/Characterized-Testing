//
//  SuvRentals.swift
//  CarRentalBilling
//
//  Created by Sayed Abdo on 6/5/18.
//  Copyright © 2018 Ameer Gaafar. All rights reserved.
//

import Foundation
class SuvRental: Rental {
    
    override init(vehicle: Vehicle, mileage: Int, daysRented: Int, lateFee: Bool) {
        super.init(vehicle: vehicle, mileage: mileage, daysRented: daysRented, lateFee: lateFee)
    }
    
    override func getReward() -> Int {
        if !self.lateFee {
            if  self.daysRented > 5
            {
                rewardPoints += (self.daysRented - 5);
            }
        }
        return rewardPoints
    }
    
    override func getAmount() -> Double {
        thisAmount=50.0;
        thisAmount += Double(150*self.daysRented)
        if self.kilometersRented > self.daysRented*70
        {
            thisAmount += Double((self.kilometersRented - self.daysRented*70) * 2)
        }
        thisAmount-=thisAmount*0.05
        if self.lateFee {
            thisAmount+=thisAmount*0.03;
        }
        return thisAmount
    }
}
