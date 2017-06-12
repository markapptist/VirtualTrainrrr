//
//  RegTrainTimesVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-30.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class RegTrainTimesVC: RegTravelVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.pageControl.isHidden = false
        self.titleLbl.text = "How often would you like to train?"
    
        option1Lbl.text = "Daily"
        option2Lbl.text = "2-3 Days a Week"
        option3Lbl.text = "4 or More Days a Week"
        option4Lbl.text = "Once a Week"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func nextBtnPressed() {
        let vc = RegTimesOfDayVC()
        present(vc, animated: true, completion: nil)
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
