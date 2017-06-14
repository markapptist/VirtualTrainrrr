//
//  RegFitnessGoalsVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-30.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit
import Graph

class RegFitnessGoalsVC: RegTravelVC {
    
    let option5Btn = UIButton()
    let option5Lbl = UILabel()
    
    var selections: Dictionary<Int, Activity> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageControl.isHidden = false
        self.titleLbl.text = "What are your fitness goals?"
        
        option1Lbl.text = Activity.weightLoss.actName()
        option2Lbl.text = Activity.trimmed.actName()
        option3Lbl.text = Activity.muscle.actName()
        option4Lbl.text = Activity.healthier.actName()
        
        self.view.addSubview(option5Btn)
        
        option5Btn.backgroundColor = UIColor.white
        option5Btn.alpha = 0.2
        option5Btn.layer.borderWidth = 1
        option5Btn.titleLabel?.font = standardFont
        option5Btn.layer.borderColor = UIColor.black.cgColor
        option5Btn.setImage(#imageLiteral(resourceName: "checked_ic.png"), for: .selected)
        option5Btn.imageEdgeInsets = UIEdgeInsetsMake(0, -100, 0, 0)
        option5Btn.imageView?.isHidden = true
        option5Btn.translatesAutoresizingMaskIntoConstraints = false
        
        option5Btn.topAnchor.constraint(equalTo: option4Btn.bottomAnchor, constant: 0).isActive = true
        option5Btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        option5Btn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        option5Btn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        option5Btn.addTarget(self, action: #selector(option5BtnPressed), for: .touchUpInside)
        
        self.view.addSubview(option5Lbl)
        option5Lbl.text = Activity.endurance.actName()
        option5Lbl.font = standardFont
        option5Lbl.textAlignment = .center
        option5Lbl.textColor = UIColor.white
        option5Lbl.translatesAutoresizingMaskIntoConstraints = false
        option5Lbl.centerXAnchor.constraint(equalTo: option5Btn.centerXAnchor).isActive = true
        option5Lbl.centerYAnchor.constraint(equalTo: option5Btn.centerYAnchor).isActive = true
        option5Lbl.widthAnchor.constraint(equalTo: option5Btn.widthAnchor).isActive = true
        option5Lbl.heightAnchor.constraint(equalTo: option5Btn.heightAnchor).isActive = true
    }
    
    override func option1BtnPressed() {
        if(!option1Btn.isSelected) {
            option1Btn.isSelected = true
            nextButton.isHidden = false
            option1Btn.alpha = 0.7
            selections.updateValue(.weightLoss, forKey: 1)
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
            selections.updateValue(.trimmed, forKey: 2)
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
            selections.updateValue(.muscle, forKey: 3)
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
            selections.updateValue(.healthier, forKey: 4)
        }   else {
            option4Btn.isSelected = false
            option4Btn.alpha = 0.2
            selections.removeValue(forKey: 4)
        }
        self.checkNoneSelected()
    }
    
    func option5BtnPressed(){
        if(!option5Btn.isSelected) {
            option5Btn.isSelected = true
            nextButton.isHidden = false
            option5Btn.alpha = 0.7
            selections.updateValue(.endurance, forKey: 5)
            
        }   else {
            option5Btn.isSelected = false
            option5Btn.alpha = 0.2
            selections.removeValue(forKey: 5)
        }
        self.checkNoneSelected()
    }
    
    override func checkNoneSelected() {
        if(!option1Btn.isSelected && !option2Btn.isSelected && !option3Btn.isSelected && !option4Btn.isSelected && !option5Btn.isSelected)
        {
            nextButton.isHidden = true
        }
    }
    
    override func nextBtnPressed() {
        // object to store in memory
        var goals: Array = [Int]()
        for activity in selections.values {
            goals.append(activity.rawValue)
        }
        // store
        UserDefaults.standard.set(goals, forKey: UserDefaultItems.activity.nameDefaults())
        let trainTimes = RegTrainTimesVC()
        self.present(trainTimes, animated: true, completion: nil)
    }
    
}
