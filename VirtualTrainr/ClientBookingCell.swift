//
//  ClientBookingCell.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-12.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class ClientBookingCell: UITableViewCell {
    
    let locationIcon = UIImageView()
    
    let nameLbl = UILabel()
    let locationLbl = UILabel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        imageView?.makeRound()
        imageView?.contentMode = .scaleAspectFill
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView?.heightAnchor.constraint(equalToConstant: 100).isActive = true
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
        nameLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        locationLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        locationLbl.adjustsFontSizeToFitWidth = true
        locationLbl.textAlignment = .left
        locationLbl.textColor = UIColor.lightGray
        self.addSubview(locationLbl)
        locationLbl.translatesAutoresizingMaskIntoConstraints = false
        locationLbl.topAnchor.constraint(equalTo: self.nameLbl.bottomAnchor, constant: 0).isActive = true
        locationLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        locationLbl.leadingAnchor.constraint(equalTo: (imageView?.trailingAnchor)!, constant: 25).isActive = true
        locationLbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        
        locationIcon.image = #imageLiteral(resourceName: "location_gray_ic.png")
        self.addSubview(locationIcon)
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.leadingAnchor.constraint(equalTo: self.nameLbl.leadingAnchor, constant: 1).isActive = true
        locationIcon.topAnchor.constraint(equalTo: self.locationLbl.topAnchor).isActive = true
        locationIcon.widthAnchor.constraint(equalTo: self.locationLbl.widthAnchor, multiplier: 0.06).isActive = true
        locationIcon.heightAnchor.constraint(equalTo: self.locationLbl.heightAnchor, multiplier: 0.3).isActive = true
}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
      
