//
//  RegGenderVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-30.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class RegGenderVC: RegisterVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageControl.currentPage = 1
        self.titleLbl.text = "What gender do you identify with?"
        
        topLabel.isHidden = false
        bottomLabel.isHidden = false
        topButton.isHidden = false
        bottomButton.isHidden = false
        topLabel.text = "Male"
        bottomLabel.text = "Female"
    }
    
    override func topBtnPressed() {
        UserDefaults.standard.set("Male", forKey: "Gender")
        let findTrainer = RegKeepNotifiedVC()
        present(findTrainer, animated: true, completion: nil)
    }
    
    override func bottomBtnPressed() {
        UserDefaults.standard.set("Female", forKey: "Gender")
        let findTrainer = RegKeepNotifiedVC()
        present(findTrainer, animated: true, completion: nil)
    }
    
}
