//
//  TrainerCell.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-18.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class TrainerCell: UITableViewCell {
    
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
    
    let mailBtn = UIImageView()
    let likeBtn = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        imageView?.makeRound()
        imageView?.contentMode = .scaleAspectFit
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView?.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        imageView?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.addSubview(nameLbl)
        nameLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        nameLbl.textAlignment = .left
        nameLbl.textColor = UIColor.black
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        nameLbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        nameLbl.leadingAnchor.constraint(equalTo: (imageView?.trailingAnchor)!, constant: 10).isActive = true
        nameLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        
        locationLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        locationLbl.adjustsFontSizeToFitWidth = true
        locationLbl.textAlignment = .left
        locationLbl.textColor = UIColor.lightGray
        self.addSubview(locationLbl)
        locationLbl.translatesAutoresizingMaskIntoConstraints = false
        locationLbl.topAnchor.constraint(equalTo: self.nameLbl.bottomAnchor, constant: 0).isActive = true
        locationLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
        locationLbl.leadingAnchor.constraint(equalTo: (imageView?.trailingAnchor)!, constant: 25).isActive = true
        locationLbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        
        locationIcon.image = #imageLiteral(resourceName: "location_gray_ic.png")
        self.addSubview(locationIcon)
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.leadingAnchor.constraint(equalTo: self.nameLbl.leadingAnchor, constant: 0).isActive = true
        locationIcon.centerYAnchor.constraint(equalTo: self.locationLbl.centerYAnchor).isActive = true
        locationIcon.widthAnchor.constraint(equalTo: self.locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        locationIcon.heightAnchor.constraint(equalTo: self.locationLbl.heightAnchor, multiplier: 0.6).isActive = true
        
        star1.image = goldStar
        star1.contentMode = .scaleAspectFit
        self.addSubview(star1)
        star1.translatesAutoresizingMaskIntoConstraints = false
        star1.leadingAnchor.constraint(equalTo: self.nameLbl.leadingAnchor, constant: 0).isActive = true
        star1.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 10).isActive = true
        star1.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.2).isActive = true
        star1.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.6).isActive = true
        
        star2.image = goldStar
        star2.contentMode = .scaleAspectFit
        self.addSubview(star2)
        star2.translatesAutoresizingMaskIntoConstraints = false
        star2.leadingAnchor.constraint(equalTo: self.star1.trailingAnchor, constant: 0).isActive = true
        star2.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 10).isActive = true
        star2.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.2).isActive = true
        star2.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.6).isActive = true
        
        star3.image = goldStar
        star3.contentMode = .scaleAspectFit
        self.addSubview(star3)
        star3.translatesAutoresizingMaskIntoConstraints = false
        star3.leadingAnchor.constraint(equalTo: self.star2.trailingAnchor, constant: 0).isActive = true
        star3.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 10).isActive = true
        star3.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.2).isActive = true
        star3.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.6).isActive = true
        
        star4.image = goldStar
        star4.contentMode = .scaleAspectFit
        self.addSubview(star4)
        star4.translatesAutoresizingMaskIntoConstraints = false
        star4.leadingAnchor.constraint(equalTo: self.star3.trailingAnchor, constant: 0).isActive = true
        star4.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 10).isActive = true
        star4.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.2).isActive = true
        star4.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.6).isActive = true
        
        star5.image = emptyStar
        star5.contentMode = .scaleAspectFit
        self.addSubview(star5)
        star5.translatesAutoresizingMaskIntoConstraints = false
        star5.leadingAnchor.constraint(equalTo: self.star4.trailingAnchor, constant: 0).isActive = true
        star5.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 10).isActive = true
        star5.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.2).isActive = true
        star5.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.6).isActive = true
        
        mailBtn.image = #imageLiteral(resourceName: "mail_sub_ic")
        self.addSubview(mailBtn)
        mailBtn.contentMode = .scaleAspectFit
        mailBtn.translatesAutoresizingMaskIntoConstraints = false
        mailBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        mailBtn.topAnchor.constraint(equalTo: self.nameLbl.topAnchor, constant: 0).isActive = true
        mailBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1).isActive = true
        mailBtn.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        
        likeBtn.image = #imageLiteral(resourceName: "favorite_ic")
        self.addSubview(likeBtn)
        likeBtn.contentMode = .scaleAspectFit
        likeBtn.translatesAutoresizingMaskIntoConstraints = false
        likeBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        likeBtn.topAnchor.constraint(equalTo: self.mailBtn.bottomAnchor, constant: 20).isActive = true
        likeBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1).isActive = true
        likeBtn.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
