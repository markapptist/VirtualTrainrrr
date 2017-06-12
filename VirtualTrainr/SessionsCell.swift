//
//  SessionsCell.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-28.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class SessionsCell: UITableViewCell {

    let lbl = UILabel()
 
    let priceBtn = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
   
        self.backgroundColor = UIColor.darkGray

        
        self.addSubview(lbl)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "SFUIText-Light", size: 20)
        lbl.text = "Label"
        lbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        lbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        lbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        
        self.addSubview(priceBtn)
        priceBtn.translatesAutoresizingMaskIntoConstraints = false
        priceBtn.makeRound()
        priceBtn.layer.cornerRadius = 10
        priceBtn.backgroundColor = UIColor.init(red: 66/255, green: 122/255, blue: 160/255, alpha: 1.0)

        priceBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
        priceBtn.centerYAnchor.constraint(equalTo: self.lbl.centerYAnchor).isActive = true
        priceBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        priceBtn.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        
        priceBtn.setTitle("$65", for: .normal)
        priceBtn.titleLabel?.textColor = UIColor.white
        priceBtn.titleLabel?.font = UIFont(name: "SFUIText-Light", size: 20)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
