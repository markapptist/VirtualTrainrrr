//
//  RegisterVC.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/3/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

class RegisterVC: UIViewController {
    
    var topButton = UIButton()
    var topLabel = UILabel()
    var bottomButton = UIButton()
    var bottomLabel = UILabel()

    
    // view
    let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
    let backBtn = UIButton(type: .system)
    let vtLogo = UIImageView()
    let titleLbl = UILabel()
    
    var subTitleLbl: UILabel?
    
    let heavyFont = UIFont(name: "SFUIDisplay-Thin", size: 30)
    let subtitleFont = UIFont(name: "SFUIText-LightItalic", size: 15)
    let standardFont = UIFont(name: "SFUIText-Light", size: 15)

    let pageControl = UIPageControl()
    
    // images
    let backBtnImage = UIImage(named: "back_icon")
    let vtImage = UIImage(named: "vt_icon")
    let backgroundImage = UIImage(named: "intro_background")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = backgroundImage
        view.addSubview(backgroundImageView)
        
        vtLogo.image = vtImage
        vtLogo.contentMode = .scaleAspectFit
        view.addSubview(vtLogo)
        
        backBtn.frame = CGRect()
        backBtn.setImage(backBtnImage, for: .normal)
        backBtn.tintColor = UIColor.white
        backBtn.addTarget(self, action: #selector(self.backBtnPressed), for: .touchUpInside)
        view.addSubview(backBtn)
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        backBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        backBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.1).isActive = true
        backBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        vtLogo.translatesAutoresizingMaskIntoConstraints = false
        vtLogo.centerYAnchor.constraint(equalTo: self.backBtn.centerYAnchor, constant: 0).isActive = true
        vtLogo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        vtLogo.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.09).isActive = true
        vtLogo.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.09).isActive = true
        
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.size(forNumberOfPages: 3)
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.topAnchor.constraint(equalTo: vtLogo.bottomAnchor, constant: 0).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        pageControl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        
  
        titleLbl.font = heavyFont
        titleLbl.textAlignment = .center
       // titleLbl.adjustsFontSizeToFitWidth = true
        titleLbl.numberOfLines = 0
        titleLbl.lineBreakMode = .byTruncatingMiddle
        titleLbl.textColor = UIColor.white
        view.addSubview(titleLbl)
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 0).isActive = true
        titleLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        titleLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        
        subTitleLbl = UILabel()
        subTitleLbl?.font = UIFont(name: "SFUIText-LightItalic", size: 15)
        self.view.addSubview(subTitleLbl!)
        subTitleLbl?.isHidden = true
        subTitleLbl?.textColor = UIColor.white
        subTitleLbl?.numberOfLines = 0
        subTitleLbl?.textAlignment = .center
        subTitleLbl?.translatesAutoresizingMaskIntoConstraints = false
        subTitleLbl?.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: 0).isActive = true
        subTitleLbl?.centerXAnchor.constraint(equalTo: self.titleLbl.centerXAnchor, constant: 0).isActive = true
        subTitleLbl?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        subTitleLbl?.heightAnchor.constraint(equalTo: self.titleLbl.heightAnchor, multiplier: 0.1).isActive = true
        
        
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
        
        bottomLabel.isHidden = true
    }
    
    func backBtnPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func topBtnPressed() {

    }
    
    func bottomBtnPressed() {
    }

    
}
