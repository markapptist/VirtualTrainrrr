//
//  Person.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-31.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit
import CoreLocation

enum SocialProfiles {
    case facebook, googlePlus, linkedIn
}

enum Gender: String {
    case male, female
    
    func genderString() -> String {
        switch self {
        case .male:
            return "Male"
        case .female:
            return "Female"
        }
    }
}

class Person: NSObject {
    
    // user properties
    private var id: String? = nil
    private var firstName: String? = nil
    private var lastName: String? = nil
    private var address: CLLocationCoordinate2D? = nil
    private var currentLocation: CLLocationCoordinate2D? = nil
    private var gender: Gender? = nil
    private var birthdate: Date? = nil
    private var preferences: Preferences? = nil
    private var aboutMe: String? = nil
    private var socialProfiles: Array<SocialProfiles>? = nil
//    var financialAccount: 
//    var profilePic: UIImage
    private var notifications: Notification? = nil
    private var canNotify: Bool? = nil
    
    func setUserID(id: String) {
        self.id = id
    }
    
    func setName(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func setUserAddress(location: CLLocationCoordinate2D) {
        self.address = location
    }
    
    func setCurrentLocation(location: CLLocationCoordinate2D) {
        self.currentLocation = location
    }
    
    func setGender(gender: Gender) {
        self.gender = gender
    }
    
    func setBirthdate(date: Date) {
        self.birthdate = date
    }
    
    func setAboutMe(text: String) {
        self.aboutMe = text
    }
    
    func setPreferences() {
        
    }
    
    func setCanNotify(value: Bool) {
        self.canNotify = value
    }
}

