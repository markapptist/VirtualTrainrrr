//
//  TrainerCollectionViewCell.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-20.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class TrainerCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    let star1 = UIImageView()
    let star2 = UIImageView()
    let star3 = UIImageView()
    let star4 = UIImageView()
    let star5 = UIImageView()
    
    let goldStar = #imageLiteral(resourceName: "full_star")
    let emptyStar = #imageLiteral(resourceName: "empty_star")
    
    let locationIcon = UIImageView()
    
    let nameLbl = UILabel()
    let locationLbl = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(imageView)
        
        imageView.makeRound()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 22).isActive = true
        
        self.contentView.addSubview(nameLbl)
        nameLbl.font = UIFont(name: "SFUIText-Regular", size: 12)
        nameLbl.textAlignment = .left
        nameLbl.text = "John Thomas"
        nameLbl.adjustsFontSizeToFitWidth = true
        nameLbl.textColor = UIColor.gray
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6).isActive = true
        nameLbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.07).isActive = true
        nameLbl.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 0).isActive = true
        nameLbl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        
        locationLbl.font = UIFont(name: "SFUIText-Light", size: 13)
        locationLbl.adjustsFontSizeToFitWidth = true
        locationLbl.textAlignment = .center
        locationLbl.text = " 5km away"
        locationLbl.adjustsFontSizeToFitWidth = true
        locationLbl.textColor = UIColor.lightGray
        self.contentView.addSubview(locationLbl)
        locationLbl.translatesAutoresizingMaskIntoConstraints = false
        locationLbl.topAnchor.constraint(equalTo: self.nameLbl.bottomAnchor, constant: 5).isActive = true
        locationLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        locationLbl.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 0).isActive = true
        locationLbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.07).isActive = true
        
        locationIcon.image = #imageLiteral(resourceName: "location_gray_ic.png")
        self.contentView.addSubview(locationIcon)
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.trailingAnchor.constraint(equalTo: self.locationLbl.leadingAnchor, constant: -2).isActive = true
        locationIcon.centerYAnchor.constraint(equalTo: self.locationLbl.centerYAnchor).isActive = true
        locationIcon.widthAnchor.constraint(equalTo: self.locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        locationIcon.heightAnchor.constraint(equalTo: self.locationLbl.heightAnchor, multiplier: 0.6).isActive = true
        
        star1.image = goldStar
        star1.contentMode = .scaleAspectFit
        self.contentView.addSubview(star1)
        star1.translatesAutoresizingMaskIntoConstraints = false
        star1.leadingAnchor.constraint(equalTo: self.locationLbl.leadingAnchor, constant: 5).isActive = true
        star1.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 5).isActive = true
        star1.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.15).isActive = true
        star1.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.55).isActive = true
        
        star2.image = goldStar
        star2.contentMode = .scaleAspectFit
        self.contentView.addSubview(star2)
        star2.translatesAutoresizingMaskIntoConstraints = false
        star2.leadingAnchor.constraint(equalTo: self.star1.trailingAnchor, constant: 0).isActive = true
        star2.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 5).isActive = true
        star2.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.15).isActive = true
        star2.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.55).isActive = true
        
        star3.image = goldStar
        star3.contentMode = .scaleAspectFit
        self.contentView.addSubview(star3)
        star3.translatesAutoresizingMaskIntoConstraints = false
        star3.leadingAnchor.constraint(equalTo: self.star2.trailingAnchor, constant: 0).isActive = true
        star3.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 5).isActive = true
        star3.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.15).isActive = true
        star3.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.55).isActive = true
        
        star4.image = goldStar
        star4.contentMode = .scaleAspectFit
        self.contentView.addSubview(star4)
        star4.translatesAutoresizingMaskIntoConstraints = false
        star4.leadingAnchor.constraint(equalTo: self.star3.trailingAnchor, constant: 0).isActive = true
        star4.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 5).isActive = true
        star4.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.15).isActive = true
        star4.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.55).isActive = true
        
        star5.image = emptyStar
        star5.contentMode = .scaleAspectFit
        self.contentView.addSubview(star5)
        star5.translatesAutoresizingMaskIntoConstraints = false
        star5.leadingAnchor.constraint(equalTo: self.star4.trailingAnchor, constant: 0).isActive = true
        star5.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 5).isActive = true
        star5.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.15).isActive = true
        star5.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.55).isActive = true
        
        let startBtn = SelectedItemButton()
        
        self.addSubview(startBtn)
        startBtn.titleLbl.text = "Starting at $100"
        startBtn.titleLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        startBtn.titleLbl.textColor = startBtn.blueCol
        startBtn.layer.cornerRadius = 20
        startBtn.translatesAutoresizingMaskIntoConstraints = false
        startBtn.topAnchor.constraint(equalTo: star1.bottomAnchor, constant: 15).isActive = true
        startBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        startBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        startBtn.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.17).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
