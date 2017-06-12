//
//  TrainerMeetUpVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-19.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class TrainerMeetUpVC: RegGenderVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.backgroundImageView.removeFromSuperview()
        
        self.view.backgroundColor = UIColor.init(red: 57/255, green: 85/255, blue: 142/255, alpha: 1.0)
        
        self.vtLogo.isHidden = true
        
        self.pageControl.isHidden = true
        
        self.topButton.removeFromSuperview()
        self.bottomButton.removeFromSuperview()
        self.topLabel.removeFromSuperview()
        self.bottomLabel.removeFromSuperview()
        
        self.titleLbl.removeFromSuperview()
        
        self.view.addSubview(titleLbl)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.font = heavyFont
        titleLbl.textAlignment = .center
        titleLbl.numberOfLines = 0
        titleLbl.lineBreakMode = .byTruncatingMiddle
        titleLbl.textColor = UIColor.white
        view.addSubview(titleLbl)
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.topAnchor.constraint(equalTo: vtLogo.bottomAnchor, constant: -20).isActive = true
        titleLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        titleLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        
        self.titleLbl.text = "How would you like to train?"
        
        topButton.titleLabel?.font = standardFont
        topButton.titleLabel?.textColor = UIColor.white
        view.addSubview(topButton)
        
        topButton.translatesAutoresizingMaskIntoConstraints = false
        topButton.layer.cornerRadius = 8
        topButton.layer.borderColor = UIColor.clear.cgColor
        topButton.layer.borderWidth = 1
        topButton.layer.backgroundColor = UIColor.white.cgColor
        topButton.layer.opacity = 0.2
        topButton.layer.cornerRadius = 30
        topButton.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 20).isActive = true
        topButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
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
        
        bottomButton.titleLabel?.font = standardFont
        bottomButton.titleLabel?.textColor = UIColor.white
        view.addSubview(bottomButton)
        
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.layer.cornerRadius = 8
        bottomButton.layer.borderColor = UIColor.clear.cgColor
        bottomButton.layer.backgroundColor = UIColor.white.cgColor
        bottomButton.layer.borderWidth = 1
        bottomButton.layer.opacity = 0.2
        bottomButton.layer.cornerRadius = 30
        bottomButton.topAnchor.constraint(equalTo: topButton.bottomAnchor, constant: 15).isActive = true
        bottomButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        bottomButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        bottomButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
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
        
        
        
        topLabel.text = "Meet Trainer Locally"
        bottomLabel.text = "Virtual 1-1 Video"

    }
    
    override func topBtnPressed() {
     
        present(TrainerMeetUpLocationVC(), animated: true, completion: nil)

    }
    
    override func bottomBtnPressed() {
       
        
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
