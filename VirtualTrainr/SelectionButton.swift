//
//  SelectionButton.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-30.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class SelectionButton: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let emptyCircle = CircleButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    let fillCircle = CircleButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    
    let textLbl = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(emptyCircle)
        
        emptyCircle.translatesAutoresizingMaskIntoConstraints = false
        emptyCircle.layer.borderWidth = 1
        emptyCircle.layer.borderColor = UIColor.black.cgColor
        emptyCircle.setColorClear()
        emptyCircle.makeRound()
        emptyCircle.widthAnchor.constraint(equalToConstant: 50).isActive = true
        emptyCircle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emptyCircle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        emptyCircle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        emptyCircle.addTarget(self, action: #selector(circlePressed), for: .touchUpInside)
        
        let radius = emptyCircle.frame.width/2
        emptyCircle.layer.cornerRadius = radius
        emptyCircle.clipsToBounds = true
        
        self.addSubview(fillCircle)
        fillCircle.isHidden = true
        fillCircle.backgroundColor = UIColor.init(red: 57/255, green: 85/255, blue: 142/255, alpha: 1.0)
        fillCircle.makeRound()
        fillCircle.translatesAutoresizingMaskIntoConstraints = false
        fillCircle.widthAnchor.constraint(equalTo: emptyCircle.widthAnchor, multiplier: 0.8).isActive = true
        fillCircle.heightAnchor.constraint(equalTo: emptyCircle.heightAnchor, multiplier: 0.8).isActive = true
        fillCircle.centerXAnchor.constraint(equalTo: emptyCircle.centerXAnchor).isActive = true
        fillCircle.centerYAnchor.constraint(equalTo: emptyCircle.centerYAnchor).isActive = true
        fillCircle.addTarget(self, action: #selector(circlePressed), for: .touchUpInside)
        
        self.addSubview(textLbl)
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        textLbl.leadingAnchor.constraint(equalTo: emptyCircle.trailingAnchor, constant: 20).isActive = true
        textLbl.centerYAnchor.constraint(equalTo: emptyCircle.centerYAnchor).isActive = true
        textLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        textLbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true 
    }
    
    func circlePressed() {
        
        if(fillCircle.isHidden) {
            fillCircle.isHidden = false
        }
        
        else if(!fillCircle.isHidden){
            fillCircle.isHidden = true
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
