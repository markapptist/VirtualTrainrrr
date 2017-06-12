//
//  SelectTimeDateVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-30.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit
import FSCalendar

class SelectTimeDateVC: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    let calendar = FSCalendar()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let topView = UIView()
        
        self.view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        topView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
        topView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        topView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        topView.layer.borderWidth = 0
        topView.backgroundColor = UIColor.init(red: 53/255, green: 123/255, blue: 175/255, alpha: 1.0)
        
        let topViewLbl = UILabel()
        
        self.view.addSubview(topViewLbl)
        topViewLbl.translatesAutoresizingMaskIntoConstraints = false
        topViewLbl.text = "Select a time to meet your trainer"
        topViewLbl.font = UIFont(name: "SFUIText-Light", size: 20)
        topViewLbl.adjustsFontSizeToFitWidth = true
        topViewLbl.textColor = UIColor.white
        topViewLbl.textAlignment = .center
        topViewLbl.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.8).isActive = true
        topViewLbl.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.7).isActive = true
        topViewLbl.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        topViewLbl.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
    
        
        calendar.scope = .week
        self.view.addSubview(calendar)
        
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        calendar.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        calendar.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4).isActive = true
        
        let row1 = addSelectionBtnRow(anchor: calendar.bottomAnchor, constant: 0)
        

        // Do any additional setup after loading the view.
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
