//
//  RegFindTrainer.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-30.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class RegFindTrainerVC: RegisterVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageControl.currentPage = 2
        
        self.titleLbl.text = "Allow app to use "
        
        topLabel.isHidden = false
        topButton.isHidden = false
        topLabel.text = "Use My Location"
    }
    
    override func topBtnPressed() {
        let travelVC = RegTravelVC()
        present(travelVC, animated: true, completion: nil)
    }
    
}
