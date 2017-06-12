//
//  RegTrainerWhen.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-31.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class RegTrainerWhen: RegTravelVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.titleLbl.text = "When do you intend to get a trainer?"
        
        option1Btn.setTitle("Right Away", for: .normal)
        option2Btn.setTitle("Not Sure", for: .normal)
        option3Btn.setTitle("Fishing Around", for: .normal)
        
        option1Lbl.text = "Right Away"
        option2Lbl.text = "Not Sure"
        option3Lbl.text = "Fishing Around"
        
        option4Btn.removeFromSuperview()
        option4Lbl.removeFromSuperview()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func nextBtnPressed() {
        let vc = RegKeepNotifiedVC()
        present(vc, animated: false, completion: nil)
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
