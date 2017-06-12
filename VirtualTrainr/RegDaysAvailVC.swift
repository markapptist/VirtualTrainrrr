//
//  RegDaysAvailVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-30.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class RegDaysAvailVC: RegFitnessGoalsVC {
    
    let option6Btn = UIButton()
    let option7Btn = UIButton()
    
    let option6Lbl = UILabel()
    let option7Lbl = UILabel()
    
    var daysAvail: NSMutableDictionary? = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.pageControl.isHidden = false
        self.titleLbl.text = "Which days are you available?"
        
        option1Lbl.text = "Monday"
        option2Lbl.text = "Tuesday"
        option3Lbl.text = "Wednesday"
        option4Lbl.text = "Thursday"
        option5Lbl.text = "Friday"
        
        option1Btn.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: -5).isActive = true
        
        self.view.addSubview(option6Btn)
        
        option6Btn.backgroundColor = UIColor.white
        option6Btn.alpha = 0.2
        option6Btn.layer.borderWidth = 1
        option6Btn.titleLabel?.font = standardFont
        option6Btn.layer.borderColor = UIColor.black.cgColor
        option6Btn.setImage(#imageLiteral(resourceName: "checked_ic.png"), for: .selected)
        option6Btn.imageEdgeInsets = UIEdgeInsetsMake(0, -100, 0, 0)
        option6Btn.imageView?.isHidden = true
        option6Btn.translatesAutoresizingMaskIntoConstraints = false
        
        option6Btn.topAnchor.constraint(equalTo: option5Btn.bottomAnchor, constant: 0).isActive = true
        option6Btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        option6Btn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        option6Btn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        option6Btn.addTarget(self, action: #selector(option6BtnPressed), for: .touchUpInside)
        
        self.view.addSubview(option6Lbl)
        option6Lbl.text = "Saturday"
        option6Lbl.font = standardFont
        option6Lbl.textAlignment = .center
        option6Lbl.textColor = UIColor.white
        option6Lbl.translatesAutoresizingMaskIntoConstraints = false
        option6Lbl.centerXAnchor.constraint(equalTo: option6Btn.centerXAnchor).isActive = true
        option6Lbl.centerYAnchor.constraint(equalTo: option6Btn.centerYAnchor).isActive = true
        option6Lbl.widthAnchor.constraint(equalTo: option6Btn.widthAnchor).isActive = true
        option6Lbl.heightAnchor.constraint(equalTo: option6Btn.heightAnchor).isActive = true
        
        self.view.addSubview(option7Btn)
        
        option7Btn.setTitle("Sunday", for: .normal)
        option7Btn.backgroundColor = UIColor.white
        option7Btn.alpha = 0.2
        option7Btn.layer.borderWidth = 1
        option7Btn.titleLabel?.font = standardFont
        option7Btn.layer.borderColor = UIColor.black.cgColor
        option7Btn.setImage(#imageLiteral(resourceName: "checked_ic.png"), for: .selected)
        option7Btn.imageEdgeInsets = UIEdgeInsetsMake(0, -100, 0, 0)
        option7Btn.imageView?.isHidden = true
        option7Btn.translatesAutoresizingMaskIntoConstraints = false
        
        option7Btn.topAnchor.constraint(equalTo: option6Btn.bottomAnchor, constant: 0).isActive = true
        option7Btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        option7Btn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        option7Btn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        option7Btn.addTarget(self, action: #selector(option7BtnPressed), for: .touchUpInside)
        
        self.view.addSubview(option7Lbl)
        option7Lbl.text = "Sunday"
        option7Lbl.font = standardFont
        option7Lbl.textAlignment = .center
        option7Lbl.textColor = UIColor.white
        option7Lbl.translatesAutoresizingMaskIntoConstraints = false
        option7Lbl.centerXAnchor.constraint(equalTo: option7Btn.centerXAnchor).isActive = true
        option7Lbl.centerYAnchor.constraint(equalTo: option7Btn.centerYAnchor).isActive = true
        option7Lbl.widthAnchor.constraint(equalTo: option7Btn.widthAnchor).isActive = true
        option7Lbl.heightAnchor.constraint(equalTo: option7Btn.heightAnchor).isActive = true
        
        self.view.bringSubview(toFront: self.nextButton)
    }
    
    override func option1BtnPressed() {
        if(!option1Btn.isSelected) {
            option1Btn.isSelected = true
            nextButton.isHidden = false
            option1Btn.alpha = 0.7
            daysAvail?.setValue(option1Lbl.text!, forKey: "1")
        }   else {
            option1Btn.isSelected = false
            option1Btn.alpha = 0.2
            daysAvail?.removeObject(forKey: "1")
        }
        self.checkNoneSelected()
    }
    
    override func option2BtnPressed() {
        if(!option2Btn.isSelected) {
            option2Btn.isSelected = true
            nextButton.isHidden = false
            option2Btn.alpha = 0.7
            daysAvail?.setValue(option2Lbl.text!, forKey: "2")
        }   else {
            option2Btn.isSelected = false
            option2Btn.alpha = 0.2
            daysAvail?.removeObject(forKey: "2")
        }
        self.checkNoneSelected()
    }
    
    override func option3BtnPressed() {
        if(!option3Btn.isSelected) {
            option3Btn.isSelected = true
            nextButton.isHidden = false
            option3Btn.alpha = 0.7
            daysAvail?.setValue(option3Lbl.text!, forKey: "3")
        }   else {
            option3Btn.isSelected = false
            option3Btn.alpha = 0.2
            daysAvail?.removeObject(forKey: "3")
        }
        self.checkNoneSelected()
    }
    
    override func option4BtnPressed() {
        if(!option4Btn.isSelected) {
            option4Btn.isSelected = true
            nextButton.isHidden = false
            option4Btn.alpha = 0.7
            daysAvail?.setValue(option4Lbl.text!, forKey: "4")
        }   else {
            option4Btn.isSelected = false
            option4Btn.alpha = 0.2
            daysAvail?.removeObject(forKey: "4")
        }
        self.checkNoneSelected()
    }
    
    override func option5BtnPressed() {
        if(!option5Btn.isSelected) {
            option5Btn.isSelected = true
            nextButton.isHidden = false
            option5Btn.alpha = 0.7
            daysAvail?.setValue(option5Lbl.text!, forKey: "5")
            
        }   else {
            option5Btn.isSelected = false
            option5Btn.alpha = 0.2
            daysAvail?.removeObject(forKey: "5")
        }
        self.checkNoneSelected()
    }
    
    func option6BtnPressed(){
        if(!option6Btn.isSelected) {
            option6Btn.isSelected = true
            nextButton.isHidden = false
            option6Btn.alpha = 0.7
            daysAvail?.setValue(option6Lbl.text!, forKey: "6")
        }   else {
            option6Btn.isSelected = false
            option6Btn.alpha = 0.2
            daysAvail?.removeObject(forKey: "6")
        }
        self.checkNoneSelected()
    }
    
    func option7BtnPressed(){
        if(!option7Btn.isSelected) {
            option7Btn.isSelected = true
            nextButton.isHidden = false
            option7Btn.alpha = 0.7
            daysAvail?.setValue(option7Lbl.text!, forKey: "7")
        }   else {
            option7Btn.isSelected = false
            option7Btn.alpha = 0.2
            daysAvail?.removeObject(forKey: "7")
        }
        self.checkNoneSelected()
    }
    
    override func checkNoneSelected() {
        if(!option1Btn.isSelected && !option2Btn.isSelected && !option3Btn.isSelected && !option4Btn.isSelected && !option5Btn.isSelected && !option6Btn.isSelected && !option7Btn.isSelected)
        {
            nextButton.isHidden = true
        }
    }
    
    override func nextBtnPressed() {
        UserDefaults.standard.set(daysAvail, forKey: "DaysAvail")
        let birthdate = RegBirthdateVC()
        self.present(birthdate, animated: true, completion: nil)
    }
    
}
