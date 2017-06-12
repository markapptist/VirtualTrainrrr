//
//  LanguageCell.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-22.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class LanguageCell: UITableViewCell {
    
    let lbl = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = UIColor.darkGray
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(lbl)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "SFUIText-Light", size: 20)
        lbl.text = "Label"
        lbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        lbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        lbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true

        
            
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
