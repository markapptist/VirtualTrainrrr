//
//  RegBirthdateVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-30.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class RegBirthdateVC: RegTravelVC {
    
    let birthdateBtn = UIButton()
    let datePicker = UIDatePicker()
    let birthdateTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        option1Btn.removeFromSuperview()
        option2Btn.removeFromSuperview()
        option3Btn.removeFromSuperview()
        option4Btn.removeFromSuperview()
        
        option1Lbl.removeFromSuperview()
        option2Lbl.removeFromSuperview()
        option3Lbl.removeFromSuperview()
        option4Lbl.removeFromSuperview()
        
        titleLbl.text = "Please enter your birthdate"
        
        self.view.addSubview(birthdateTextField)
        self.birthdateTextField.addSubview(birthdateBtn)
        
        birthdateBtn.setImage(#imageLiteral(resourceName: "birthday_ic.png"), for: .normal)
        birthdateBtn.imageView?.alpha = 0.6
        birthdateBtn.imageView?.contentMode = .scaleAspectFit
        birthdateBtn.imageEdgeInsets = UIEdgeInsetsMake(15, -200, 15, 50)
        birthdateBtn.addTarget(self, action: #selector(dateBtnPressed), for: .touchUpInside)
        birthdateBtn.translatesAutoresizingMaskIntoConstraints = false
        
        birthdateBtn.layer.borderWidth = 1
        birthdateBtn.layer.cornerRadius = 8
        birthdateBtn.layer.borderColor = UIColor.lightGray.cgColor
        birthdateBtn.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: 10).isActive = true
        birthdateBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        birthdateBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        birthdateBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        birthdateTextField.translatesAutoresizingMaskIntoConstraints = false
        birthdateTextField.font = standardFont
        birthdateTextField.textColor = UIColor.white
        birthdateTextField.textAlignment = .right
        birthdateTextField.centerXAnchor.constraint(equalTo: birthdateBtn.centerXAnchor, constant: 5).isActive = true
        birthdateTextField.centerYAnchor.constraint(equalTo: birthdateBtn.centerYAnchor).isActive = true
        birthdateTextField.widthAnchor.constraint(equalTo: birthdateBtn.widthAnchor, multiplier: 0.8).isActive = true
        birthdateTextField.heightAnchor.constraint(equalTo: birthdateBtn.heightAnchor, multiplier: 1.0).isActive = true
        
        datePicker.isHidden = true
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = UIColor.white
        self.view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        datePicker.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 10).isActive = true
        datePicker.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        datePicker.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
        
        nextButton.removeFromSuperview()
        
        self.view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton.animateRadius(scale: 1.2, soundOn: false)
        nextButton.animateWithNewImage(scale: 1.2, soundOn: false, image: #imageLiteral(resourceName: "forward_ic.png"))
        nextButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        nextButton.topAnchor.constraint(equalTo: self.birthdateBtn.bottomAnchor, constant: 35).isActive = true
    }
    
    func dateBtnPressed() {
        if(datePicker.isHidden == true) {
            datePicker.isHidden = false
            nextButton.isHidden = false
        }
        birthdateTextField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
    }
    
    func datePickerChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        birthdateTextField.text = formatter.string(from: sender.date)
        print(birthdateTextField.text)
    }
    
    override func nextBtnPressed() {
        UserDefaults.standard.set(birthdateTextField.text!, forKey: "Birthdate")
        let vc = RegTrainerWhen()
        present(vc, animated: true, completion: nil)
    }
    
}
