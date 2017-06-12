//
//  SelectedItemButton.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-03.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class SelectedItemButton: ItemButton {
    
    let blueCol = UIColor.init(red: 55/255, green: 97/255, blue: 161/255, alpha: 1.0)
    

    required init(frame: CGRect) {
        super.init(frame: frame)
        
        
        innerCircle.removeFromSuperview()
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0).isActive = true
        titleLbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0).isActive = true
        titleLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLbl.textAlignment = .center
        titleLbl.textColor = UIColor.black
        
        self.layer.borderColor = blueCol.cgColor
        
        self.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
    }
    
    func setPressed() {
        self.backgroundColor = blueCol
        self.isSelected = true
        titleLbl.textColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func btnPressed() {
        if(!self.isSelected) {
            self.backgroundColor = blueCol
            self.isSelected = true
            titleLbl.textColor = UIColor.white
            
        }

        else if(self.isSelected) {
            self.backgroundColor = UIColor.white
            self.isSelected = false
            titleLbl.textColor = UIColor.black
        }
    }

}
