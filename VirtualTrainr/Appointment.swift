//
//  Appointment.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 10/4/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation

struct Appointment {
    
    let price: NSDecimalNumber
    let session: String
    let description: String
    
    let tax = NSDecimalNumber(string: "1.13")
    
    init(price: NSDecimalNumber, session: String, description: String) {
        self.price = price
        self.session = session
        self.description = description
    }
    
    // total price
    func total() -> NSDecimalNumber {
        return self.price.multiplying(by: tax)
    }

}
