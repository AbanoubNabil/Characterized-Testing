//
//  Douple+Formetter.swift
//  CarRentalBilling
//
//  Created by Sayed Abdo on 6/15/18.
//  Copyright © 2018 Ameer Gaafar. All rights reserved.
//

import Foundation
extension Double {
    
    func formatted2f() -> String {
         return (String(format: "%.2f", self))
    }
}
