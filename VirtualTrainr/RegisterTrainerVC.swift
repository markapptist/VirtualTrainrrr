//
//  RegisterTrainerVC.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/3/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

class RegisterTrainerVC: RegisterVC {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.isHidden = true
        
        self.titleLbl.text = "Please choose what you would like to register as"
        topLabel.isHidden = false
        bottomLabel.isHidden = false
        topButton.isHidden = false
        bottomButton.isHidden = false
        
        topLabel.text = "Trainer"
        bottomLabel.text = "Gym"
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        bottomButton.addTarget(self, action: #selector(self.bottomBtnPressed), for: .touchUpInside)
        
    }
    
    
    override func topBtnPressed() {
        let vc = LogInWithEmailVC()
        self.present(vc, animated: true, completion: nil)
    }
    
    override func bottomBtnPressed() {
        let name = RegNameVC()
        self.present(name, animated: true, completion: nil)
    }
    
}
