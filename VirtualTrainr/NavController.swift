//
//  NavController.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-25.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class NavController: UINavigationController, UINavigationControllerDelegate {
    
    var titleImageView: UIImageView?
    var titleImg: UIImage?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationBar.isHidden = false
        
        self.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "SFUIDisplay-Light", size: 17)!]
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
       
    }
    
  

    
}
