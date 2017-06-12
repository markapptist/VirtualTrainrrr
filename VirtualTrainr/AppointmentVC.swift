//
//  SchedulingVC.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/3/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit
import FSCalendar


class AppointmentVC: UIViewController {
    
    let calendar = MyCalendar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(calendar)
        
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        calendar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        calendar.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor).isActive = true
        calendar.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
       
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        self.tabBarController?.tabBar.isHidden = false 
    }
    
    
}
