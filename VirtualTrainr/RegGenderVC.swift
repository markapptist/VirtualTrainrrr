//
//  RegGenderVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-30.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class RegGenderVC: RegisterVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.pageControl.currentPage = 1
        
        self.titleLbl.text = "What gender do you identify with?"
        
        topLabel.isHidden = false
        bottomLabel.isHidden = false
        topButton.isHidden = false
        bottomButton.isHidden = false
        topLabel.text = "Male"
        bottomLabel.text = "Female"

        
    }
    
    override func topBtnPressed() {
        let findTrainer = RegFindTrainerVC()
        present(findTrainer, animated: true, completion: nil)
        
    }
    
    override func bottomBtnPressed() {

        let findTrainer = RegFindTrainerVC()
        present(findTrainer, animated: true, completion: nil)
        
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
