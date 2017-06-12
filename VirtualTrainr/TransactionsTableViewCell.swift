//
//  TransactionsAvailTableViewCell.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-11.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class TransactionsTableViewCell: UITableViewCell {
    
    let leftLbl = UILabel()
    
    let midLbl = UILabel()
    
    let rightLbl = UILabel()
    
    var setBold = false
    
    let boldFont = UIFont(name: "SFUIText-Medium", size: 12)
    
    let regFont = UIFont(name: "SFUIText-Light", size: 12)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        if setBold {
            leftLbl.font = boldFont
            midLbl.font = boldFont
            rightLbl.font = boldFont
        } else {
            leftLbl.font = regFont
            midLbl.font = regFont
            rightLbl.font = regFont
        }
        
        self.addSubview(leftLbl)
        
        leftLbl.translatesAutoresizingMaskIntoConstraints = false
        leftLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        leftLbl.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        leftLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        leftLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.addSubview(midLbl)
        
        midLbl.translatesAutoresizingMaskIntoConstraints = false
        midLbl.leadingAnchor.constraint(equalTo: leftLbl.trailingAnchor, constant: 5).isActive = true
        midLbl.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        midLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        midLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.addSubview(rightLbl)
        
        rightLbl.translatesAutoresizingMaskIntoConstraints = false
        rightLbl.leadingAnchor.constraint(equalTo: midLbl.trailingAnchor, constant: 10).isActive = true
        rightLbl.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        rightLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        rightLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
