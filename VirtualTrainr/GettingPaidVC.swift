//
//  GettingPaidVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-11.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class GettingPaidVC: UIViewController {
    
    let addWithdrawalBtn = SelectedItemButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addWithdrawalBtn.titleLbl.text = "Add A Withdrawal Method"
        addWithdrawalBtn.titleLbl.font = UIFont(name: "SFUIText-Light", size: 20)
        addWithdrawalBtn.makeRound()
        addWithdrawalBtn.layer.cornerRadius = 5
        self.view.addSubview(addWithdrawalBtn)
        addWithdrawalBtn.translatesAutoresizingMaskIntoConstraints = false
        addWithdrawalBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        addWithdrawalBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        addWithdrawalBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        addWithdrawalBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
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
