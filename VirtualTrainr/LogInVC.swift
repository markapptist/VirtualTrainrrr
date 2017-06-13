//
//  LogInVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-31.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class LogInVC: SignUpVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLbl.text = "Log In"
        self.subTitleLbl?.text = "Please select an option below to log in"
        
        self.registerLbl.text = "Log In With Email"
        self.linkedInLbl.text = "LinkedIn"
        self.googleLbl.text = "Google"        
    }

}
