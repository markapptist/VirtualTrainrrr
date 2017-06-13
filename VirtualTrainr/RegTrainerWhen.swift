//
//  RegTrainerWhen.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-31.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class RegTrainerWhen: RegTravelVC {
    
    var trainerWhen: NSMutableDictionary? = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trainerWhen = ["Right Away":false, "Not Sure":false, "Fishing Around":false]
        
        self.titleLbl.text = "When do you intend to get a trainer?"
        
        option1Btn.setTitle("Right Away", for: .normal)
        option2Btn.setTitle("Not Sure", for: .normal)
        option3Btn.setTitle("Fishing Around", for: .normal)
        
        option1Lbl.text = "Right Away"
        option2Lbl.text = "Not Sure"
        option3Lbl.text = "Fishing Around"
        
        option4Btn.removeFromSuperview()
        option4Lbl.removeFromSuperview()
    }
    
    override func option1BtnPressed() {
        if(!option1Btn.isSelected) {
            option1Btn.isSelected = true
            option2Btn.isSelected = false
            option3Btn.isSelected = false
            nextButton.isHidden = false
            option1Btn.alpha = 0.7
            option2Btn.alpha = 0.2
            option3Btn.alpha = 0.2
            trainerWhen?.setValue(true, forKey: option1Lbl.text!)
            trainerWhen?.setValue(false, forKey: option2Lbl.text!)
            trainerWhen?.setValue(false, forKey: option3Lbl.text!)
        }   else {
            option1Btn.isSelected = false
            option1Btn.alpha = 0.2
            trainerWhen?.removeObject(forKey: option1Lbl.text!)
        }
        self.checkNoneSelected()
    }
    
    override func option2BtnPressed() {
        if(!option2Btn.isSelected) {
            option2Btn.isSelected = true
            option1Btn.isSelected = false
            option3Btn.isSelected = false
            nextButton.isHidden = false
            option2Btn.alpha = 0.7
            option1Btn.alpha = 0.2
            option3Btn.alpha = 0.2
            trainerWhen?.setValue(true, forKey: option2Lbl.text!)
            trainerWhen?.setValue(false, forKey: option1Lbl.text!)
            trainerWhen?.setValue(false, forKey: option3Lbl.text!)
        }   else {
            option2Btn.isSelected = false
            option2Btn.alpha = 0.2
            trainerWhen?.removeObject(forKey: option2Lbl.text!)
        }
        self.checkNoneSelected()
    }
    
    override func option3BtnPressed() {
        if(!option3Btn.isSelected) {
            option3Btn.isSelected = true
            option1Btn.isSelected = false
            option2Btn.isSelected = false
            nextButton.isHidden = false
            option3Btn.alpha = 0.7
            option1Btn.alpha = 0.2
            option2Btn.alpha = 0.2
            trainerWhen?.setValue(true, forKey: option3Lbl.text!)
            trainerWhen?.setValue(false, forKey: option1Lbl.text!)
            trainerWhen?.setValue(false, forKey: option2Lbl.text!)
        }   else {
            option3Btn.isSelected = false
            option3Btn.alpha = 0.2
            trainerWhen?.removeObject(forKey: option3Lbl.text!)
        }
        self.checkNoneSelected()
    }
    
    override func nextBtnPressed() {
        UserDefaults.standard.set(trainerWhen, forKey: "TrainerWhen")
        let vc = RegKeepNotifiedVC()
        present(vc, animated: false, completion: nil)
    }
}
