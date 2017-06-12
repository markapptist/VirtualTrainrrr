//
//  TrainerMeetDoneVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-19.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class TrainerMeetDoneVC: TrainerMeetUpVC {
    
    let star1 = UIImageView()
    let star2 = UIImageView()
    let star3 = UIImageView()
    let star4 = UIImageView()
    let star5 = UIImageView()
    
    let locationLbl = UILabel()
    let locationIcon = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topButton.removeFromSuperview()
        topLabel.removeFromSuperview()
        bottomButton.removeFromSuperview()
        bottomLabel.removeFromSuperview()

        
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
        titleLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        titleLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true

        
        titleLbl.text = "The trainer you chose has been notified and will contact you shortly"
        
        let imageView = UIImageView()
        self.view.addSubview(imageView)
        imageView.makeRound()
        imageView.image = #imageLiteral(resourceName: "sample_image.png")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10).isActive = true
        
        
        let nameLbl = UILabel()
        self.view.addSubview(nameLbl)
        nameLbl.text = "Johnathan Smith"
        nameLbl.font = UIFont(name: "SFUIText-Light", size: 18)
        nameLbl.textAlignment = .center
        nameLbl.textColor = UIColor.white
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        nameLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.02).isActive = true
        nameLbl.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: -5).isActive = true
        nameLbl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        
        locationLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        locationLbl.adjustsFontSizeToFitWidth = true
        locationLbl.textAlignment = .center
        locationLbl.textColor = UIColor.lightGray
        locationLbl.text = "5km away"
        self.view.addSubview(locationLbl)
        locationLbl.translatesAutoresizingMaskIntoConstraints = false
        locationLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 6).isActive = true
        locationLbl.centerXAnchor.constraint(equalTo: nameLbl.centerXAnchor, constant: 0).isActive = true
        locationLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        locationLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        
        locationIcon.image = #imageLiteral(resourceName: "location_gray_ic.png")
        self.view.addSubview(locationIcon)
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.leadingAnchor.constraint(equalTo: locationLbl.leadingAnchor, constant: -15).isActive = true
        locationIcon.centerYAnchor.constraint(equalTo: self.locationLbl.centerYAnchor).isActive = true
        locationIcon.widthAnchor.constraint(equalTo: self.locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        locationIcon.heightAnchor.constraint(equalTo: self.locationLbl.heightAnchor, multiplier: 0.6).isActive = true
        
        
        star1.image = #imageLiteral(resourceName: "full_star")
        star1.contentMode = .scaleAspectFit
        self.view.addSubview(star1)
        star1.translatesAutoresizingMaskIntoConstraints = false
        star1.centerXAnchor.constraint(equalTo: locationLbl.centerXAnchor, constant: -20).isActive = true
        star1.topAnchor.constraint(equalTo: locationLbl.bottomAnchor, constant: 0).isActive = true
        star1.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        star1.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        star2.image = #imageLiteral(resourceName: "full_star")
        star2.contentMode = .scaleAspectFit
        self.view.addSubview(star2)
        star2.translatesAutoresizingMaskIntoConstraints = false
        star2.leadingAnchor.constraint(equalTo: self.star1.trailingAnchor, constant: 1).isActive = true
        star2.topAnchor.constraint(equalTo: locationLbl.bottomAnchor, constant: 0).isActive = true
        star2.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        star2.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        star3.image = #imageLiteral(resourceName: "full_star")
        star3.contentMode = .scaleAspectFit
        self.view.addSubview(star3)
        star3.translatesAutoresizingMaskIntoConstraints = false
        star3.leadingAnchor.constraint(equalTo: self.star2.trailingAnchor, constant: 1).isActive = true
        star3.topAnchor.constraint(equalTo: locationLbl.bottomAnchor, constant: 0).isActive = true
        star3.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        star3.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        star4.image = #imageLiteral(resourceName: "empty_star")
        star4.contentMode = .scaleAspectFit
        self.view.addSubview(star4)
        star4.translatesAutoresizingMaskIntoConstraints = false
        star4.leadingAnchor.constraint(equalTo: self.star3.trailingAnchor, constant: 1).isActive = true
        star4.topAnchor.constraint(equalTo: locationLbl.bottomAnchor, constant: 0).isActive = true
        star4.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        star4.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        star5.image = #imageLiteral(resourceName: "empty_star")
        star5.contentMode = .scaleAspectFit
        self.view.addSubview(star5)
        star5.translatesAutoresizingMaskIntoConstraints = false
        star5.leadingAnchor.constraint(equalTo: self.star4.trailingAnchor, constant: 1).isActive = true
        star5.topAnchor.constraint(equalTo: locationLbl.bottomAnchor, constant: 0).isActive = true
        star5.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        star5.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        self.view.addSubview(bottomButton)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.topAnchor.constraint(equalTo: star1.bottomAnchor, constant: 20).isActive = true
        bottomButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        bottomButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        bottomButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.11).isActive = true
        
        self.view.addSubview(bottomLabel)
        bottomLabel.font = standardFont
        bottomLabel.textAlignment = .center
        bottomLabel.text = "Done"
        bottomLabel.textColor = UIColor.white
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.centerXAnchor.constraint(equalTo: bottomButton.centerXAnchor).isActive = true
        bottomLabel.centerYAnchor.constraint(equalTo: bottomButton.centerYAnchor).isActive = true
        bottomLabel.widthAnchor.constraint(equalTo: bottomButton.widthAnchor).isActive = true
        bottomLabel.heightAnchor.constraint(equalTo: bottomButton.heightAnchor).isActive = true


    }
    
    override func bottomBtnPressed() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }

}
