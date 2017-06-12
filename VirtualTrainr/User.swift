//
//  User.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-31.
//  Copyright © 2017 Apptist. All rights reserved.
//

class User {
    
    var email: String
    var uid: String
    var name: String?
    
    init(uid: String, email: String, name: String?) {
        self.uid = uid
        self.email = email
        self.name = name
    }
    
}

