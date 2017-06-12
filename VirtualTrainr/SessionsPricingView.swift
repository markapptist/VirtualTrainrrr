//
//  SessionsPricingVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-17.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class SessionsPricingView: UIView {
    
    var sessionTitle: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white

        let lbl = UILabel()
        self.addSubview(lbl)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        lbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        lbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        
        lbl.font = UIFont(name: "SFUIText-Light", size: 20)
        lbl.textAlignment = .left
        lbl.text = sessionTitle
        
        let btn = SelectionButton()
        self.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        btn.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        btn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        btn.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
