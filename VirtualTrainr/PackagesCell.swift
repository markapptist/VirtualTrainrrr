//
//  PackagesCell.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-28.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class PackagesCell: UITableViewCell {


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = UIColor.darkGray
        
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        let titleLbl = UILabel()
        self.addSubview(titleLbl)
        titleLbl.textColor = UIColor.white
        titleLbl.text = "Package Title"
        titleLbl.font = UIFont(name: "SFUIText-Light", size: 20)
        titleLbl.textAlignment = .left
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        titleLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
        titleLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        titleLbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
