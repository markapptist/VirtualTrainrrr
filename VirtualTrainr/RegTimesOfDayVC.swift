//
//  RegTimesOfDayVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-30.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class RegTimesOfDayVC: RegTravelVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.pageControl.isHidden = false
        self.titleLbl.text = "What time of day are you available?"
    
        option1Lbl.text = "Morning (before 9am)"
        option2Lbl.text = "Late Morning (9am to noon)"
        option3Lbl.text = "Afternoon (noon to 3pm)"
        option4Lbl.text = "Late Afternoon (3pm - 6pm)"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func nextBtnPressed() {
        let vc = RegDaysAvailVC()
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
