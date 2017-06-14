//
//  RegTrainTimesVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-30.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class RegTrainTimesVC: RegTravelVC {
    
    var selections: Dictionary<Int, HowOften> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageControl.isHidden = false
        self.titleLbl.text = "How often would you like to train?"
        
        option1Lbl.text = HowOften.daily.frequency()
        option2Lbl.text = HowOften.twoToThreeDays.frequency()
        option3Lbl.text = HowOften.fourOrMore.frequency()
        option4Lbl.text = HowOften.onceAWeek.frequency()
        
        // missing label for 'To be determined by my Trainer'
    
        print(UserDefaults.standard.array(forKey: "activity"))
        let array = UserDefaults.standard.array(forKey: "activity") as! [Activity]
        for activity in array {
            let activityCase = activity
            print(activityCase)
        }
 
    }
    
    override func option1BtnPressed() {
        if(!option1Btn.isSelected) {
            option1Btn.isSelected = true
            nextButton.isHidden = false
            option1Btn.alpha = 0.7
            selections.updateValue(.daily, forKey: 1)
            
        }   else {
            option1Btn.isSelected = false
            option1Btn.alpha = 0.2
            selections.removeValue(forKey: 1)
        }
        self.checkNoneSelected()
    }
    
    override func option2BtnPressed() {
        if(!option2Btn.isSelected) {
            option2Btn.isSelected = true
            nextButton.isHidden = false
            option2Btn.alpha = 0.7
            selections.updateValue(.twoToThreeDays, forKey: 2)
            
        }   else {
            option2Btn.isSelected = false
            option2Btn.alpha = 0.2
            selections.removeValue(forKey: 2)
        }
        self.checkNoneSelected()
    }
    
    override func option3BtnPressed() {
        if(!option3Btn.isSelected) {
            option3Btn.isSelected = true
            nextButton.isHidden = false
            option3Btn.alpha = 0.7
            selections.updateValue(.fourOrMore, forKey: 3)
            
        }   else {
            option3Btn.isSelected = false
            option3Btn.alpha = 0.2
            selections.removeValue(forKey: 3)
        }
        self.checkNoneSelected()
    }
    
    override func option4BtnPressed() {
        if(!option4Btn.isSelected) {
            option4Btn.isSelected = true
            nextButton.isHidden = false
            option4Btn.alpha = 0.7
            selections.updateValue(.onceAWeek, forKey: 4)
            
        }   else {
            option4Btn.isSelected = false
            option4Btn.alpha = 0.2
            selections.removeValue(forKey: 4)
        }
        self.checkNoneSelected()
    }
    
    override func nextBtnPressed() {
        var times: Array = [HowOften]()
        for time in selections.values {
            times.append(time)
        }
        UserDefaults.standard.set(times, forKey: "HowOften")
        let vc = RegTimesOfDayVC()
        present(vc, animated: true, completion: nil)
    }
}
