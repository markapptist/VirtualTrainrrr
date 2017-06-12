//
//  DataBase.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/5/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class DataBase: NSObject {
    
    // MARK: - Database References
    var mainRef: DatabaseReference {
        return Database.database().reference()
    }
    
    var pubRef: DatabaseReference {
        return mainRef.child("Public")
    }
    
    var usersRef: DatabaseReference {
        return mainRef.child("users")
    }
    
    var trainersRef: DatabaseReference {
        return mainRef.child("OnlineTrainers")
    }
    
    var seekerProfileRef: DatabaseReference {
        return pubRef.child("SeekerProfiles")
    }
    
    
    // MARK: - Storage References
    var mainStorageRef: StorageReference {
        return Storage.storage().reference()
    }
    
    //    var userStorageRef: StorageReference {
    //        return mainStorageRef.child("users")
    //    }
    
    // create unique id
    func createUniqueID() -> String {
        return "\(NSUUID().uuidString)"
    }
}
