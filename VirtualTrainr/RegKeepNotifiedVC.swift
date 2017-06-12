//
//  RegKeepNotifiedVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-31.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class RegKeepNotifiedVC: RegFindTrainerVC {
    
    let skipBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.pageControl.currentPage = 5
        
        self.subTitleLbl?.removeFromSuperview()
        
        self.view.addSubview(subTitleLbl!)
        
        self.subTitleLbl?.translatesAutoresizingMaskIntoConstraints = false
        self.subTitleLbl?.isHidden = false
        self.subTitleLbl?.numberOfLines = 2
        self.subTitleLbl?.text = "Send me notifications to keep me up to date with everything"
        subTitleLbl?.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: 0).isActive = true
        subTitleLbl?.centerXAnchor.constraint(equalTo: self.titleLbl.centerXAnchor, constant: 0).isActive = true
        subTitleLbl?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        subTitleLbl?.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        topButton.removeFromSuperview()

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
        topButton.topAnchor.constraint(equalTo: (subTitleLbl?.bottomAnchor)!, constant: 20).isActive = true
        topButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        topButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        topButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        topButton.isHidden = true
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


        topLabel.isHidden = false
        topButton.isHidden = false
        topLabel.text = "Send me notifications"

        
        self.titleLbl.text = "Keep Me Notified"
        self.view.addSubview(skipBtn)
        skipBtn.translatesAutoresizingMaskIntoConstraints = false
        skipBtn.setTitle("Skip", for: .normal)
        skipBtn.centerYAnchor.constraint(equalTo: self.vtLogo.centerYAnchor).isActive = true
        skipBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        skipBtn.heightAnchor.constraint(equalTo: self.backBtn.heightAnchor, constant: 0).isActive = true
        skipBtn.widthAnchor.constraint(equalTo: self.backBtn.widthAnchor, constant: 0).isActive = true
    }
    
    override func topBtnPressed() {
        let vc = SignUpVC()
        present(vc, animated: true, completion: nil)

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
