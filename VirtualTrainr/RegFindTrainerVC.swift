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
        
        // Do any additional setup after loading the view.
        
        self.pageControl.currentPage = 2
        
        self.titleLbl.text = "Find me a trainer close to my location"
        
        topLabel.isHidden = false
        topButton.isHidden = false
        topLabel.text = "Use My Location"
        
        
    }
    
    override func topBtnPressed() {
        
        let travelVC = RegTravelVC()
        present(travelVC, animated: true, completion: nil)
        
    }

    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
