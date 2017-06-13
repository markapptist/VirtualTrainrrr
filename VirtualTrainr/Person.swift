//
//  Person.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-31.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit
import CoreLocation

class Person: NSObject {
    
    enum Gender {
        case male
        case female
    }
    
    // user properties
    var id: String
    var firstName: String
    var lastName: String
    var address: CLLocationCoordinate2D
    var currentLocation: CLLocationCoordinate2D
    var gender: Gender
    var birthdate: Date
    
    var email: String
    var name: String?
    
    
    init(id: String, email: String, name: String?) {
        self.id = id
        self.email = email
        self.name = name
    }
    
}

