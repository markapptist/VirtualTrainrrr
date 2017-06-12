//
//  ItemButtonBlue.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-18.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class ItemButtonBlue: ItemButton {
    

    required override init(frame: CGRect) {
        super.init(frame: frame)
        let radius = self.frame.width/8
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.titleLbl.textColor = UIColor.white
        self.titleLbl.textAlignment = .center
        self.backgroundColor = UIColor.init(red: 63/255, green: 108/255, blue: 171/255, alpha: 1.0)
        
        innerCircle.isHidden = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
        let radius = self.frame.width/2
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        
        
        
    }


}
