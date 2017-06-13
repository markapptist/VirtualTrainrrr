//
//  RegTimesOfDayVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-30.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class RegTimesOfDayVC: RegTravelVC {
    
    var timesAvail: NSMutableDictionary? = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageControl.isHidden = false
        self.titleLbl.text = "What time of day are you available?"
        
        // follow invision page text
        
        option1Lbl.text = "Before 9am"
        option2Lbl.text = "9am to noon"
        option3Lbl.text = "Noon to 3pm"
        option4Lbl.text = "3pm - 6pm"
        
        // missing label for 'Evening (after 6pm)'
    }
    
    override func option1BtnPressed() {
        if(!option1Btn.isSelected) {
            option1Btn.isSelected = true
            nextButton.isHidden = false
            option1Btn.alpha = 0.7
            timesAvail?.setValue(option1Lbl.text!, forKey: "1")
            
        }   else {
            option1Btn.isSelected = false
            option1Btn.alpha = 0.2
            timesAvail?.removeObject(forKey: 1)
        }
        self.checkNoneSelected()
    }
    
    override func option2BtnPressed() {
        if(!option2Btn.isSelected) {
            option2Btn.isSelected = true
            nextButton.isHidden = false
            option2Btn.alpha = 0.7
            timesAvail?.setValue(option1Lbl.text!, forKey: "2")
            
        }   else {
            option2Btn.isSelected = false
            option2Btn.alpha = 0.2
            timesAvail?.removeObject(forKey: 2)
        }
        self.checkNoneSelected()
    }
    
    override func option3BtnPressed() {
        if(!option3Btn.isSelected) {
            option3Btn.isSelected = true
            nextButton.isHidden = false
            option3Btn.alpha = 0.7
            timesAvail?.setValue(option3Lbl.text!, forKey: "3")
            
        }   else {
            option3Btn.isSelected = false
            option3Btn.alpha = 0.2
            timesAvail?.removeObject(forKey: "3")
        }
        
        self.checkNoneSelected()
    }
    
    override func option4BtnPressed() {
        if(!option4Btn.isSelected) {
            option4Btn.isSelected = true
            nextButton.isHidden = false
            option4Btn.alpha = 0.7
            timesAvail?.setValue(option4Lbl.text!, forKey: "4")
            
        }   else {
            option4Btn.isSelected = false
            option4Btn.alpha = 0.2
            timesAvail?.removeObject(forKey: "4")
        }
        self.checkNoneSelected()
    }
    
    override func nextBtnPressed() {
        UserDefaults.standard.set(timesAvail, forKey: "TimesAvail")
        let vc = RegDaysAvailVC()
        present(vc, animated: true, completion: nil)
    }
    
}
