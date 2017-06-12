//
//  ReviewCell.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-28.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {
    
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
     let reviewLbl = UILabel()
    let dateLbl = UILabel()

    let mailBtn = UIImageView()
    let likeBtn = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = UIColor.darkGray

        
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
        nameLbl.font = UIFont(name: "SFUIText-Light", size: 18)
        nameLbl.textAlignment = .left
        nameLbl.textColor = UIColor.white
        nameLbl.text = "User Name"
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25).isActive = true
        nameLbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.17).isActive = true
        nameLbl.leadingAnchor.constraint(equalTo: (imageView?.trailingAnchor)!, constant: 10).isActive = true
        nameLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true

        
        star1.image = emptyStar
        star1.contentMode = .scaleAspectFit
        self.addSubview(star1)
        star1.translatesAutoresizingMaskIntoConstraints = false
        star1.leadingAnchor.constraint(equalTo: nameLbl.trailingAnchor, constant: 0).isActive = true
        star1.centerYAnchor.constraint(equalTo: nameLbl.centerYAnchor, constant: 0).isActive = true
        star1.widthAnchor.constraint(equalTo: nameLbl.widthAnchor, multiplier: 0.15).isActive = true
        star1.heightAnchor.constraint(equalTo: nameLbl.heightAnchor, multiplier: 0.6).isActive = true
        
        star2.image = emptyStar
        star2.contentMode = .scaleAspectFit
        self.addSubview(star2)
        star2.translatesAutoresizingMaskIntoConstraints = false
        star2.leadingAnchor.constraint(equalTo: star1.trailingAnchor, constant: 0).isActive = true
        star2.centerYAnchor.constraint(equalTo: star1.centerYAnchor, constant: 0).isActive = true
        star2.widthAnchor.constraint(equalTo: star1.widthAnchor, multiplier: 1.0).isActive = true
        star2.heightAnchor.constraint(equalTo: star1.heightAnchor, multiplier: 1.0).isActive = true
        
        star3.image = emptyStar
        star3.contentMode = .scaleAspectFit
        self.addSubview(star3)
        star3.translatesAutoresizingMaskIntoConstraints = false
        star3.leadingAnchor.constraint(equalTo: star2.trailingAnchor, constant: 0).isActive = true
        star3.centerYAnchor.constraint(equalTo: star2.centerYAnchor, constant: 0).isActive = true
        star3.widthAnchor.constraint(equalTo: star2.widthAnchor, multiplier: 1.0).isActive = true
        star3.heightAnchor.constraint(equalTo: star2.heightAnchor, multiplier: 1.0).isActive = true
        
        star4.image = emptyStar
        star4.contentMode = .scaleAspectFit
        self.addSubview(star4)
        star4.translatesAutoresizingMaskIntoConstraints = false
        star4.leadingAnchor.constraint(equalTo: star3.trailingAnchor, constant: 0).isActive = true
        star4.centerYAnchor.constraint(equalTo: star3.centerYAnchor, constant: 0).isActive = true
        star4.widthAnchor.constraint(equalTo: star3.widthAnchor, multiplier: 1.0).isActive = true
        star4.heightAnchor.constraint(equalTo: star3.heightAnchor, multiplier: 1.0).isActive = true
        
        star5.image = emptyStar
        star5.contentMode = .scaleAspectFit
        self.addSubview(star5)
        star5.translatesAutoresizingMaskIntoConstraints = false
        star5.leadingAnchor.constraint(equalTo: star4.trailingAnchor, constant: 0).isActive = true
        star5.centerYAnchor.constraint(equalTo: star4.centerYAnchor, constant: 0).isActive = true
        star5.widthAnchor.constraint(equalTo: star4.widthAnchor, multiplier: 1.0).isActive = true
        star5.heightAnchor.constraint(equalTo: star4.heightAnchor, multiplier: 1.0).isActive = true
        
        self.addSubview(dateLbl)
        dateLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        dateLbl.text = "Yesterday"
        dateLbl.textColor = UIColor.lightGray
        dateLbl.translatesAutoresizingMaskIntoConstraints = false
        dateLbl.leadingAnchor.constraint(equalTo: star5.trailingAnchor, constant: 1).isActive = true
        dateLbl.centerYAnchor.constraint(equalTo: star1.centerYAnchor).isActive = true
        dateLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
        dateLbl.heightAnchor.constraint(equalTo: nameLbl.heightAnchor, multiplier: 1.0).isActive = true
        
        let leadingArrow = UIImageView()
        self.addSubview(leadingArrow)
        leadingArrow.translatesAutoresizingMaskIntoConstraints = false 
        leadingArrow.image = #imageLiteral(resourceName: "arrow_right.png")
        leadingArrow.contentMode = .scaleAspectFit
        leadingArrow.leadingAnchor.constraint(equalTo: dateLbl.trailingAnchor, constant: 0.0).isActive = true
        leadingArrow.topAnchor.constraint(equalTo: dateLbl.topAnchor, constant: 0.0).isActive = true
        leadingArrow.widthAnchor.constraint(equalTo: dateLbl.widthAnchor, multiplier: 0.3).isActive = true
        leadingArrow.heightAnchor.constraint(equalTo: dateLbl.heightAnchor, multiplier: 1.0).isActive = true
        
        self.addSubview(reviewLbl)
        reviewLbl.translatesAutoresizingMaskIntoConstraints = false
        reviewLbl.text = "Jacks been back from island for a whole day jock. He always make something good"
        reviewLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        reviewLbl.textColor = UIColor.lightGray
        reviewLbl.numberOfLines = 0
        reviewLbl.textAlignment = .left
        reviewLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor, constant: 0).isActive = true
        reviewLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor).isActive = true
        reviewLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        reviewLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
