//
//  FourXFourRental.swift
//  CarRentalBilling
//
//  Created by Sayed Abdo on 6/5/18.
//  Copyright © 2018 Ameer Gaafar. All rights reserved.
//

import Foundation

class FourXFourRental: Rental {
    
    override init(vehicle: Vehicle, mileage: Int, daysRented: Int, lateFee: Bool) {
        super.init(vehicle: vehicle, mileage: mileage, daysRented: daysRented, lateFee: lateFee)
    }
    
    override func getReward() -> Int {
        if !self.lateFee {
            rewardPoints *= 2
            
        }
        return rewardPoints
    }
    
    override func getAmount() -> Double {
        thisAmount=50.0
        thisAmount += Double(200*self.daysRented)
        if !(self.kilometersRented<200)
        {
            if self.daysRented>10
            {
                thisAmount-=thisAmount*0.05
            }
        }
        if self.lateFee {
            thisAmount+=thisAmount*0.03
        }
        return thisAmount
    }
}
