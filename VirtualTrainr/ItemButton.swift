//
//  ItemButton.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-18.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class ItemButton: UIButton {

    let innerCircle = UIView()
    let titleLbl = UILabel()

    required override init(frame: CGRect) {
        super.init(frame: frame)
        let radius = self.frame.width/8
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        
        self.layer.borderWidth = 1
        self.titleLbl.adjustsFontSizeToFitWidth = true
        titleLbl.text = "item"
        titleLbl.font = UIFont(name: "SFUIText-Light", size: 12)
        self.addSubview(titleLbl)
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        titleLbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0).isActive = true
        titleLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            
        self.layer.borderColor = UIColor.lightGray.cgColor
            
        innerCircle.backgroundColor = UIColor.lightGray
        innerCircle.alpha = 0.3
        innerCircle.layer.borderWidth = 1
        innerCircle.layer.borderColor = UIColor.lightGray.cgColor
        innerCircle.layer.cornerRadius = 15
        innerCircle.clipsToBounds = true
        self.addSubview(innerCircle)
        innerCircle.translatesAutoresizingMaskIntoConstraints = false
        innerCircle.widthAnchor.constraint(equalToConstant: 25).isActive = true
        innerCircle.heightAnchor.constraint(equalToConstant: 25).isActive = true
        innerCircle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        innerCircle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3).isActive = true
        
        let cut = UIView()
        innerCircle.addSubview(cut)
        cut.backgroundColor = UIColor.darkGray
        cut.translatesAutoresizingMaskIntoConstraints = false
        cut.centerYAnchor.constraint(equalTo: innerCircle.centerYAnchor).isActive = true
        cut.centerXAnchor.constraint(equalTo: innerCircle.centerXAnchor).isActive = true
        cut.widthAnchor.constraint(equalTo: innerCircle.widthAnchor, multiplier: 0.3).isActive = true
        cut.heightAnchor.constraint(equalTo: innerCircle.heightAnchor, multiplier: 0.07).isActive = true
            
    
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
        let radius = self.frame.width/2
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        
    }
  

}
