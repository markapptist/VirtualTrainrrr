//
//  RegTrainTimesVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-30.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class RegTrainTimesVC: RegTravelVC {
    
    var times: NSMutableDictionary? = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageControl.isHidden = false
        self.titleLbl.text = "How often would you like to train?"
        
        option1Lbl.text = "Daily"
        option2Lbl.text = "2-3 Days a Week"
        option3Lbl.text = "4 or More Days a Week"
        option4Lbl.text = "Once a Week"
        
        // missing label for 'To be determined by my Trainer'
    }
    
    override func option1BtnPressed() {
        if(!option1Btn.isSelected) {
            option1Btn.isSelected = true
            nextButton.isHidden = false
            option1Btn.alpha = 0.7
            times?.setValue(option1Lbl.text!, forKey: "1")
            
        }   else {
            option1Btn.isSelected = false
            option1Btn.alpha = 0.2
            times?.removeObject(forKey: "1")
        }
        self.checkNoneSelected()
    }
    
    override func option2BtnPressed() {
        if(!option2Btn.isSelected) {
            option2Btn.isSelected = true
            nextButton.isHidden = false
            option2Btn.alpha = 0.7
            times?.setValue(option2Lbl.text!, forKey: "2")
            
        }   else {
            option2Btn.isSelected = false
            option2Btn.alpha = 0.2
            times?.removeObject(forKey: "2")
        }
        self.checkNoneSelected()
    }
    
    override func option3BtnPressed() {
        if(!option3Btn.isSelected) {
            option3Btn.isSelected = true
            nextButton.isHidden = false
            option3Btn.alpha = 0.7
            times?.setValue(option3Lbl.text!, forKey: "3")
            
        }   else {
            option3Btn.isSelected = false
            option3Btn.alpha = 0.2
            times?.removeObject(forKey: "3")
        }
        self.checkNoneSelected()
    }
    
    override func option4BtnPressed() {
        if(!option4Btn.isSelected) {
            option4Btn.isSelected = true
            nextButton.isHidden = false
            option4Btn.alpha = 0.7
            times?.setValue(option4Lbl.text!, forKey: "4")
            
        }   else {
            option4Btn.isSelected = false
            option4Btn.alpha = 0.2
            times?.removeObject(forKey: "4")
        }
        self.checkNoneSelected()
    }
    
    override func nextBtnPressed() {
        UserDefaults.standard.set(times, forKey: "TrainingTimes")
        let vc = RegTimesOfDayVC()
        present(vc, animated: true, completion: nil)
    }
}
