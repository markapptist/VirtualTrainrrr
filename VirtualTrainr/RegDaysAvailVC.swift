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
    
    func option6BtnPressed(){
        
        if(!option6Btn.isSelected) {
            option6Btn.isSelected = true
            nextButton.isHidden = false
            option6Btn.alpha = 0.7
        }   else {
            option6Btn.isSelected = false
            option6Btn.alpha = 0.2
        }
        
        if(!option1Btn.isSelected && !option2Btn.isSelected && !option3Btn.isSelected && !option4Btn.isSelected && !option5Btn.isSelected && !option6Btn.isSelected && !option7Btn.isSelected)
        {
            nextButton.isHidden = true
        }
    }
    
    func option7BtnPressed(){
        
        if(!option7Btn.isSelected) {
            option7Btn.isSelected = true
            nextButton.isHidden = false
            option7Btn.alpha = 0.7
        }   else {
            option7Btn.isSelected = false
            option7Btn.alpha = 0.2 
        }
        
        if(!option1Btn.isSelected && !option2Btn.isSelected && !option3Btn.isSelected && !option4Btn.isSelected && !option5Btn.isSelected && !option6Btn.isSelected && !option7Btn.isSelected)
        {
            nextButton.isHidden = true
        }
    }
    
    override func nextBtnPressed() {
        let birthdate = RegBirthdateVC()
        
        present(birthdate, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
