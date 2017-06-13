//
//  RegStartVC.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/3/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit
import Graph

class RegStartVC: RegisterVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.isHidden = true
        
        self.titleLbl.text = "How can Virtual TrainR assist you?"
        
        topLabel.isHidden = false
        bottomLabel.isHidden = false
        topButton.isHidden = false
        bottomButton.isHidden = false
        topLabel.text = "Help me find a trainer"
        bottomLabel.text = "Help me find new clients to train"

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        bottomButton.addTarget(self, action: #selector(self.bottomBtnPressed), for: .touchUpInside)
    }


    override func topBtnPressed() {
        let fitnessGoalsVC = RegFitnessGoalsVC()
        self.present(fitnessGoalsVC, animated: true, completion: nil)
    }
    
    override func bottomBtnPressed() {
        let trainerVC = RegisterTrainerVC()
        bottomButton.removeTarget(self, action: #selector(self.bottomBtnPressed), for: .touchUpInside)
        self.present(trainerVC, animated: true, completion: nil)
    }
}
