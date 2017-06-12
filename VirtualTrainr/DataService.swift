//
//  DataService.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-31.
//  Copyright © 2017 Apptist. All rights reserved.
//


import Foundation
import FirebaseDatabase


class DataService {
    private static let _instance = DataService()
    
    // public instance
    
    static var instance: DataService {
        return _instance
    }
    
    var generalRef: FIRDatabaseReference?
    
    //MARK: - Database References
    
    var mainRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    // users reference
    
    var usersRef: FIRDatabaseReference {
        return mainRef.child("users")
    }
    
 
    func createWallet(uid: String) {
        
    }
    
}

extension DataService {
    
    func createNewUser(uid: String, email: String) {
        
        let userProfile: [String:Any] = ["email": email]
        
        DataService.instance.usersRef.child(uid).updateChildValues(userProfile)
        
    }
    
}

