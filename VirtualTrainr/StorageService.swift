//
//  StorageService.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 2017-06-06.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import FirebaseStorage

class StorageService: DataBase {
    private static let _instance = DataService()
    
    // public instance
    static var instance: DataService {
        return _instance
    }
    
    // MARK: - User Folder
    func createUserStorageFolder(uid: String) {
        
    }
    
    // add taken image
    func addUserImage() {
        
    }
    
}
