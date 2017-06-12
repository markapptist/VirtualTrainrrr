//
//  AppLanguageVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-30.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit
import Localize_Swift

class AppLanguageVC: RegStartVC {
    
    let scrollView = UIScrollView()
    
    var thirdBtn = UIButton()
    var thirdLbl = UILabel()
    
    var fourthBtn = UIButton()
    var fourthLbl = UILabel()
    
    var fifthBtn = UIButton()
    var fifthLbl = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topButton.removeFromSuperview()
        topLabel.removeFromSuperview()
        bottomButton.removeFromSuperview()
        bottomLabel.removeFromSuperview()

        // Do any additional setup after loading the view.
        
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        scrollView.contentSize = CGSize(width: self.view.frame.width * 0.8, height: self.view.frame.height * 1.0)
        
        topButton.titleLabel?.font = standardFont
        topButton.titleLabel?.textColor = UIColor.white
        scrollView.addSubview(topButton)
        
        topButton.translatesAutoresizingMaskIntoConstraints = false
        topButton.layer.cornerRadius = 8
        topButton.layer.borderColor = UIColor.clear.cgColor
        topButton.layer.borderWidth = 1
        topButton.layer.backgroundColor = UIColor.white.cgColor
        topButton.layer.opacity = 0.2
        topButton.layer.cornerRadius = 30
        topButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        topButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        topButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        topButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        topButton.addTarget(self, action: #selector(topBtnPressed), for: .touchUpInside)
        
        self.view.addSubview(topLabel)
        topLabel.font = standardFont
        topLabel.textAlignment = .center
        topLabel.textColor = UIColor.white
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.centerXAnchor.constraint(equalTo: topButton.centerXAnchor).isActive = true
        topLabel.centerYAnchor.constraint(equalTo: topButton.centerYAnchor).isActive = true
        topLabel.widthAnchor.constraint(equalTo: topButton.widthAnchor).isActive = true
        topLabel.heightAnchor.constraint(equalTo: topButton.heightAnchor).isActive = true
        topLabel.isHidden = true
        
        bottomButton.titleLabel?.font = standardFont
        bottomButton.titleLabel?.textColor = UIColor.white
        scrollView.addSubview(bottomButton)
        
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.layer.cornerRadius = 8
        bottomButton.layer.borderColor = UIColor.clear.cgColor
        bottomButton.layer.backgroundColor = UIColor.white.cgColor
        bottomButton.layer.borderWidth = 1
        bottomButton.layer.opacity = 0.2
        bottomButton.layer.cornerRadius = 30
        bottomButton.topAnchor.constraint(equalTo: topButton.bottomAnchor, constant: 15).isActive = true
        bottomButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        bottomButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        bottomButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        bottomButton.isHidden = true
        bottomButton.addTarget(self, action: #selector(bottomBtnPressed), for: .touchUpInside)
        
        self.view.addSubview(bottomLabel)
        bottomLabel.font = standardFont
        bottomLabel.textAlignment = .center
        bottomLabel.textColor = UIColor.white
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.centerXAnchor.constraint(equalTo: bottomButton.centerXAnchor).isActive = true
        bottomLabel.centerYAnchor.constraint(equalTo: bottomButton.centerYAnchor).isActive = true
        bottomLabel.widthAnchor.constraint(equalTo: bottomButton.widthAnchor).isActive = true
        bottomLabel.heightAnchor.constraint(equalTo: bottomButton.heightAnchor).isActive = true
        
        self.titleLbl.text = "Select Language".localized()
        
        topLabel.isHidden = false
        bottomLabel.isHidden = false
        topButton.isHidden = false
        bottomButton.isHidden = false
        
        topLabel.text = "English".localized()
        bottomLabel.text = "French".localized()
        
        thirdBtn.titleLabel?.font = standardFont
        thirdBtn.titleLabel?.textColor = UIColor.white
        scrollView.addSubview(thirdBtn)
        
        thirdBtn.translatesAutoresizingMaskIntoConstraints = false
        thirdBtn.layer.cornerRadius = 8
        thirdBtn.layer.borderColor = UIColor.clear.cgColor
        thirdBtn.layer.borderWidth = 1
        thirdBtn.layer.backgroundColor = UIColor.white.cgColor
        thirdBtn.layer.opacity = 0.2
        thirdBtn.layer.cornerRadius = 30
        thirdBtn.topAnchor.constraint(equalTo: bottomButton.bottomAnchor, constant: 20).isActive = true
        thirdBtn.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        thirdBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        thirdBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        thirdBtn.addTarget(self, action: #selector(thirdBtnPressed), for: .touchUpInside)
        
        self.view.addSubview(thirdLbl)
        thirdLbl.font = standardFont
        thirdLbl.textAlignment = .center
        thirdLbl.textColor = UIColor.white
        thirdLbl.translatesAutoresizingMaskIntoConstraints = false
        thirdLbl.centerXAnchor.constraint(equalTo: thirdBtn.centerXAnchor).isActive = true
        thirdLbl.centerYAnchor.constraint(equalTo: thirdBtn.centerYAnchor).isActive = true
        thirdLbl.widthAnchor.constraint(equalTo: thirdBtn.widthAnchor).isActive = true
        thirdLbl.heightAnchor.constraint(equalTo: topButton.heightAnchor).isActive = true
        
        thirdLbl.text = "Spanish".localized()
        
        fourthBtn.titleLabel?.font = standardFont
        fourthBtn.titleLabel?.textColor = UIColor.white
        scrollView.addSubview(fourthBtn)
        
        fourthBtn.translatesAutoresizingMaskIntoConstraints = false
        fourthBtn.layer.cornerRadius = 8
        fourthBtn.layer.borderColor = UIColor.clear.cgColor
        fourthBtn.layer.backgroundColor = UIColor.white.cgColor
        fourthBtn.layer.borderWidth = 1
        fourthBtn.layer.opacity = 0.2
        fourthBtn.layer.cornerRadius = 30
        fourthBtn.topAnchor.constraint(equalTo: thirdBtn.bottomAnchor, constant: 15).isActive = true
        fourthBtn.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        fourthBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        fourthBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        fourthBtn.addTarget(self, action: #selector(fourthBtnPressed), for: .touchUpInside)
        
        self.view.addSubview(fourthLbl)
        fourthLbl.font = standardFont
        fourthLbl.textAlignment = .center
        fourthLbl.textColor = UIColor.white
        fourthLbl.translatesAutoresizingMaskIntoConstraints = false
        fourthLbl.centerXAnchor.constraint(equalTo: fourthBtn.centerXAnchor).isActive = true
        fourthLbl.centerYAnchor.constraint(equalTo: fourthBtn.centerYAnchor).isActive = true
        fourthLbl.widthAnchor.constraint(equalTo: fourthBtn.widthAnchor).isActive = true
        fourthLbl.heightAnchor.constraint(equalTo: fourthBtn.heightAnchor).isActive = true
        
        fourthLbl.text = "German".localized()
        
        fifthBtn.titleLabel?.font = standardFont
        fifthBtn.titleLabel?.textColor = UIColor.white
        scrollView.addSubview(fifthBtn)
        
        fifthBtn.translatesAutoresizingMaskIntoConstraints = false
        fifthBtn.layer.cornerRadius = 8
        fifthBtn.layer.borderColor = UIColor.clear.cgColor
        fifthBtn.layer.backgroundColor = UIColor.white.cgColor
        fifthBtn.layer.borderWidth = 1
        fifthBtn.layer.opacity = 0.2
        fifthBtn.layer.cornerRadius = 30
        fifthBtn.topAnchor.constraint(equalTo: fourthBtn.bottomAnchor, constant: 15).isActive = true
        fifthBtn.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        fifthBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        fifthBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        fifthBtn.addTarget(self, action: #selector(fifthBtnPressed), for: .touchUpInside)
        
        self.view.addSubview(fifthLbl)
        fifthLbl.font = standardFont
        fifthLbl.textAlignment = .center
        fifthLbl.textColor = UIColor.white
        fifthLbl.translatesAutoresizingMaskIntoConstraints = false
        fifthLbl.centerXAnchor.constraint(equalTo: fifthBtn.centerXAnchor).isActive = true
        fifthLbl.centerYAnchor.constraint(equalTo: fifthBtn.centerYAnchor).isActive = true
        fifthLbl.widthAnchor.constraint(equalTo: fifthBtn.widthAnchor).isActive = true
        fifthLbl.heightAnchor.constraint(equalTo: fifthBtn.heightAnchor).isActive = true
        
        fifthLbl.text = "Chinese".localized()



    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        bottomButton.addTarget(self, action: #selector(self.bottomBtnPressed), for: .touchUpInside)
        
    }
    
    
    override func topBtnPressed() {
        Localize.setCurrentLanguage("en")
        self.dismiss(animated: true, completion: nil)
    }
    
    override func bottomBtnPressed() {

        Localize.setCurrentLanguage("fr")
        self.dismiss(animated: true, completion: nil)
    }
    
    func thirdBtnPressed() {
        Localize.setCurrentLanguage("es")
        self.dismiss(animated: true, completion: nil)
    }
    
    func fourthBtnPressed() {
        Localize.setCurrentLanguage("de")
        self.dismiss(animated: true, completion: nil)
    }
    
    func fifthBtnPressed() {
        Localize.setCurrentLanguage("zh-Hant")
        self.dismiss(animated: true, completion: nil)
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
