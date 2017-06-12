//
//  OneToOneCall.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/5/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation

class OneToOneCall: NSObject {
    
    var user: User?
    var trainer: Trainer?
    var sessionID: String?
    var token: String?
    
    override init() {
        super.init()
    }
}

