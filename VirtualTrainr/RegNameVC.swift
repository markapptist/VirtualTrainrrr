//
//  RegNameVC.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/3/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

class RegNameVC: RegisterVC {
    
    let firstNameTxtField = UITextField()
    let lastNameTxtField = UITextField()
    
    let firstNameUnderView = UIView()
    let lastNameUnderView = UIView()
    
    let continueBtn = UIButton()
    let continueLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageControl.isHidden = false
        self.titleLbl.text = "What's your name?"
    
        
        firstNameTxtField.placeholder = "First Name"
        firstNameTxtField.textAlignment = .left
        firstNameTxtField.font = standardFont
        firstNameTxtField.textColor = UIColor.white
        self.view.addSubview(firstNameTxtField)
        firstNameTxtField.translatesAutoresizingMaskIntoConstraints = false
        
        firstNameTxtField.layer.borderColor = UIColor.clear.cgColor
        firstNameTxtField.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: 10).isActive = true
        firstNameTxtField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        firstNameTxtField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        firstNameTxtField.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        firstNameUnderView.backgroundColor = UIColor.white
        self.view.addSubview(firstNameUnderView)
        firstNameUnderView.translatesAutoresizingMaskIntoConstraints = false
        firstNameUnderView.topAnchor.constraint(equalTo: self.firstNameTxtField.bottomAnchor).isActive = true
        firstNameUnderView.centerXAnchor.constraint(equalTo: self.firstNameTxtField.centerXAnchor).isActive = true
        firstNameUnderView.widthAnchor.constraint(equalTo: self.firstNameTxtField.widthAnchor).isActive = true
        firstNameUnderView.heightAnchor.constraint(equalTo: self.firstNameTxtField.heightAnchor, multiplier: 0.01).isActive = true
        
        
        lastNameTxtField.placeholder = "Last Name"
        lastNameTxtField.textAlignment = .left
        lastNameTxtField.textColor = UIColor.white
        self.view.addSubview(lastNameTxtField)
        lastNameTxtField.translatesAutoresizingMaskIntoConstraints = false
        
        lastNameTxtField.font = standardFont
        lastNameTxtField.layer.borderColor = UIColor.clear.cgColor
        lastNameTxtField.topAnchor.constraint(equalTo: self.firstNameTxtField.bottomAnchor, constant: 10).isActive = true
        lastNameTxtField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        lastNameTxtField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        lastNameTxtField.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        lastNameUnderView.backgroundColor = UIColor.white
        self.view.addSubview(lastNameUnderView)
        lastNameUnderView.translatesAutoresizingMaskIntoConstraints = false
        lastNameUnderView.topAnchor.constraint(equalTo: self.lastNameTxtField.bottomAnchor).isActive = true
        lastNameUnderView.centerXAnchor.constraint(equalTo: self.lastNameTxtField.centerXAnchor).isActive = true
        lastNameUnderView.widthAnchor.constraint(equalTo: self.lastNameTxtField.widthAnchor).isActive = true
        lastNameUnderView.heightAnchor.constraint(equalTo: self.lastNameTxtField.heightAnchor, multiplier: 0.01).isActive = true
        
        self.view.addSubview(continueBtn)
        
        continueBtn.translatesAutoresizingMaskIntoConstraints = false
        continueBtn.topAnchor.constraint(equalTo: lastNameTxtField.bottomAnchor, constant: 20).isActive = true
        continueBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        continueBtn.widthAnchor.constraint(equalTo: lastNameTxtField.widthAnchor).isActive = true
        continueBtn.heightAnchor.constraint(equalTo: lastNameTxtField.heightAnchor).isActive = true
        
        continueBtn.layer.borderColor = UIColor.clear.cgColor
        continueBtn.layer.backgroundColor = UIColor.white.cgColor
        continueBtn.layer.borderWidth = 1
        continueBtn.layer.opacity = 0.2
        continueBtn.layer.cornerRadius = 30
        
        self.view.addSubview(continueLabel)
        
        continueLabel.font = standardFont
        continueLabel.text = "Continue"
        continueLabel.textAlignment = .center
        continueLabel.textColor = UIColor.white
        continueLabel.translatesAutoresizingMaskIntoConstraints = false
        continueLabel.centerXAnchor.constraint(equalTo: continueBtn.centerXAnchor).isActive = true
        continueLabel.centerYAnchor.constraint(equalTo: continueBtn.centerYAnchor).isActive = true
        continueLabel.widthAnchor.constraint(equalTo: continueBtn.widthAnchor).isActive = true
        continueLabel.heightAnchor.constraint(equalTo: continueBtn.heightAnchor).isActive = true

        
        continueBtn.addTarget(self, action: #selector(continueBtnPressed), for: .touchUpInside)
        

    }
    
    func continueBtnPressed() {
    
        if(!(firstNameTxtField.text?.isEmpty)!) {
            if(!(lastNameTxtField.text?.isEmpty)!) {
                let gender = RegGenderVC()
                present(gender, animated: true, completion: nil)
            }
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        firstNameTxtField.resignFirstResponder()
        lastNameTxtField.resignFirstResponder()
    }
    
}
