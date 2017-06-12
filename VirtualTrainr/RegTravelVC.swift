//
//  TravelVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-30.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class RegTravelVC: RegisterVC {
    
    let option1Btn = UIButton()
    let option2Btn = UIButton()
    let option3Btn = UIButton()
    let option4Btn = UIButton()
    
    let option1Lbl = UILabel()
    let option2Lbl = UILabel()
    let option3Lbl = UILabel()
    let option4Lbl = UILabel()
    
    let nextButton = CircleButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageControl.currentPage = 3

        // Do any additional setup after loading the view.
        titleLbl.text = "How far are you willing to travel to meet your trainer?"
        
        self.view.addSubview(option1Btn)
        
        option1Btn.backgroundColor = UIColor.white
        option1Btn.alpha = 0.2
        option1Btn.layer.borderWidth = 1
        option1Btn.titleLabel?.font = standardFont
        option1Btn.layer.borderColor = UIColor.black.cgColor
        option1Btn.setImage(#imageLiteral(resourceName: "checked_ic.png"), for: .selected)
        option1Btn.imageEdgeInsets = UIEdgeInsetsMake(0, -100, 0, 0)
        option1Btn.imageView?.isHidden = true
        option1Btn.translatesAutoresizingMaskIntoConstraints = false
        
        option1Btn.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 30).isActive = true
        option1Btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        option1Btn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        option1Btn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        option1Btn.addTarget(self, action: #selector(option1BtnPressed), for: .touchUpInside)
        
        self.view.addSubview(option1Lbl)
        option1Lbl.text = "Have my trainer meet me"
        option1Lbl.font = standardFont
        option1Lbl.textColor = UIColor.white
        option1Lbl.textAlignment = .center
        option1Lbl.translatesAutoresizingMaskIntoConstraints = false
        option1Lbl.centerXAnchor.constraint(equalTo: option1Btn.centerXAnchor).isActive = true
        option1Lbl.centerYAnchor.constraint(equalTo: option1Btn.centerYAnchor).isActive = true
        option1Lbl.widthAnchor.constraint(equalTo: option1Btn.widthAnchor).isActive = true
        option1Lbl.heightAnchor.constraint(equalTo: option1Btn.heightAnchor).isActive = true
        
        self.view.addSubview(option2Btn)
        
        option2Btn.backgroundColor = UIColor.white
        option2Btn.alpha = 0.2
        option2Btn.layer.borderWidth = 1
        option2Btn.titleLabel?.font = standardFont
        option2Btn.layer.borderColor = UIColor.black.cgColor
        option2Btn.setImage(#imageLiteral(resourceName: "checked_ic.png"), for: .selected)
        option2Btn.imageEdgeInsets = UIEdgeInsetsMake(0, -150, 0, 0)
        option2Btn.imageView?.isHidden = true
        option2Btn.translatesAutoresizingMaskIntoConstraints = false
        
        option2Btn.topAnchor.constraint(equalTo: option1Btn.bottomAnchor, constant: 0).isActive = true
        option2Btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        option2Btn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        option2Btn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        option2Btn.addTarget(self, action: #selector(option2BtnPressed), for: .touchUpInside)
        
        self.view.addSubview(option2Lbl)
        option2Lbl.text = "5km - 19km"
        option2Lbl.font = standardFont
        option2Lbl.textAlignment = .center
        option2Lbl.textColor = UIColor.white
        option2Lbl.translatesAutoresizingMaskIntoConstraints = false
        option2Lbl.centerXAnchor.constraint(equalTo: option2Btn.centerXAnchor).isActive = true
        option2Lbl.centerYAnchor.constraint(equalTo: option2Btn.centerYAnchor).isActive = true
        option2Lbl.widthAnchor.constraint(equalTo: option2Btn.widthAnchor).isActive = true
        option2Lbl.heightAnchor.constraint(equalTo: option2Btn.heightAnchor).isActive = true
        
        self.view.addSubview(option3Btn)
        
        option3Btn.backgroundColor = UIColor.white
        option3Btn.alpha = 0.2
        option3Btn.layer.borderWidth = 1
        option3Btn.titleLabel?.font = standardFont
        option3Btn.layer.borderColor = UIColor.black.cgColor
        option3Btn.setImage(#imageLiteral(resourceName: "checked_ic.png"), for: .selected)
        option3Btn.imageEdgeInsets = UIEdgeInsetsMake(0, -150, 0, 0)
        option3Btn.imageView?.isHidden = true
        option3Btn.translatesAutoresizingMaskIntoConstraints = false
        
        option3Btn.topAnchor.constraint(equalTo: option2Btn.bottomAnchor, constant: 0).isActive = true
        option3Btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        option3Btn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        option3Btn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        option3Btn.addTarget(self, action: #selector(option3BtnPressed), for: .touchUpInside)
        
        self.view.addSubview(option3Lbl)
        option3Lbl.text = "20km or more"
        option3Lbl.font = standardFont
        option3Lbl.textAlignment = .center
        option3Lbl.textColor = UIColor.white
        option3Lbl.translatesAutoresizingMaskIntoConstraints = false
        option3Lbl.centerXAnchor.constraint(equalTo: option3Btn.centerXAnchor).isActive = true
        option3Lbl.centerYAnchor.constraint(equalTo: option3Btn.centerYAnchor).isActive = true
        option3Lbl.widthAnchor.constraint(equalTo: option3Btn.widthAnchor).isActive = true
        option3Lbl.heightAnchor.constraint(equalTo: option3Btn.heightAnchor).isActive = true
        
        self.view.addSubview(option4Btn)
        
        option4Btn.backgroundColor = UIColor.white
        option4Btn.alpha = 0.2
        option4Btn.layer.borderWidth = 1
        option4Btn.titleLabel?.font = standardFont
        option4Btn.layer.borderColor = UIColor.black.cgColor
        option4Btn.setImage(#imageLiteral(resourceName: "checked_ic.png"), for: .selected)
        option4Btn.imageEdgeInsets = UIEdgeInsetsMake(0, -150, 0, 0)
        option4Btn.imageView?.isHidden = true
        option4Btn.translatesAutoresizingMaskIntoConstraints = false
        
        option4Btn.topAnchor.constraint(equalTo: option3Btn.bottomAnchor, constant: 0).isActive = true
        option4Btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        option4Btn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        option4Btn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        option4Btn.addTarget(self, action: #selector(option4BtnPressed), for: .touchUpInside)
        
        self.view.addSubview(option4Lbl)
        option4Lbl.text = "Virtual 1 on 1 meetings"
        option4Lbl.font = standardFont
        option4Lbl.textAlignment = .center
        option4Lbl.textColor = UIColor.white
        option4Lbl.translatesAutoresizingMaskIntoConstraints = false
        option4Lbl.centerXAnchor.constraint(equalTo: option4Btn.centerXAnchor).isActive = true
        option4Lbl.centerYAnchor.constraint(equalTo: option4Btn.centerYAnchor).isActive = true
        option4Lbl.widthAnchor.constraint(equalTo: option4Btn.widthAnchor).isActive = true
        option4Lbl.heightAnchor.constraint(equalTo: option4Btn.heightAnchor).isActive = true
        
        self.view.addSubview(nextButton)
        nextButton.isHidden = true
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton.animateRadius(scale: 1.2, soundOn: false)
        nextButton.animateWithNewImage(scale: 1.2, soundOn: false, image: #imageLiteral(resourceName: "forward_ic.png"))
        nextButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor, constant: -20).isActive = true
        nextButton.setColourWhite()
        nextButton.addTarget(self, action: #selector(nextBtnPressed), for: .touchUpInside)
    }
    
    func option1BtnPressed(){
       
        if(!option1Btn.isSelected) {
            option1Btn.isSelected = true
            nextButton.isHidden = false
            option1Btn.alpha = 0.7
        }   else {
        option1Btn.isSelected = false
            option1Btn.alpha = 0.2
        }
        
        
        if(!option1Btn.isSelected && !option2Btn.isSelected && !option3Btn.isSelected && !option4Btn.isSelected)
        {
            nextButton.isHidden = true
        }
    }
    
    func option2BtnPressed(){
        
        if(!option2Btn.isSelected) {
            option2Btn.isSelected = true
            nextButton.isHidden = false
            option2Btn.alpha = 0.7
        }   else {
            option2Btn.isSelected = false
            option2Btn.alpha = 0.2
        }
        
        
        if(!option1Btn.isSelected && !option2Btn.isSelected && !option3Btn.isSelected && !option4Btn.isSelected)
        {
            nextButton.isHidden = true
        }
    }
    
    func option3BtnPressed(){
        
        if(!option3Btn.isSelected) {
            option3Btn.isSelected = true
            nextButton.isHidden = false
            option3Btn.alpha = 0.7
        }   else {
            option3Btn.isSelected = false
            option3Btn.alpha = 0.2
        }
        
        
        if(!option1Btn.isSelected && !option2Btn.isSelected && !option3Btn.isSelected && !option4Btn.isSelected)
        {
            nextButton.isHidden = true
        }
    }
    
    func option4BtnPressed(){
        
        if(!option4Btn.isSelected) {
            option4Btn.isSelected = true
            nextButton.isHidden = false
            option4Btn.alpha = 0.7
        }   else {
            option4Btn.isSelected = false
            option4Btn.alpha = 0.2
        }
        
        if(!option1Btn.isSelected && !option2Btn.isSelected && !option3Btn.isSelected && !option4Btn.isSelected)
        {
            nextButton.isHidden = true
        }
    }
    
    func nextBtnPressed() {
        let fitnessGoals = RegFitnessGoalsVC()
        present(fitnessGoals, animated: true, completion: nil)
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
