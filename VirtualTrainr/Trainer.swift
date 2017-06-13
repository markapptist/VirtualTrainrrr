//
//  Trainer.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 2017-06-12.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation

enum Certification: String {
    case license
    
    func certificationText() -> String {
        return ""
    }
}

class Trainer: Person {
    private var credentials: String? = nil
    private var certifications: Array<Certification>? = nil
    private var verified: Bool? = nil
    private var clientHearted: Array<Client>? = nil
    private var reviews: Array<Reviews>? = nil
    private var offeredSessions: Array<Session>? = nil
    private var supportedActivities: Array<Activity>? = nil
    private var clients: Array<Client>? = nil
}
