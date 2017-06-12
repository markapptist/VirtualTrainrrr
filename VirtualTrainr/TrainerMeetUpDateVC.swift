//
//  TrainerMeetUpDateVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-19.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit
import FSCalendar

class TrainerMeetUpDateVC: TrainerMeetUpLocationVC {
    
    let calendar = MyCalendar()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLbl.text = "Select a date to meet your trainer"
        
        containerView.removeFromSuperview()
        map.view.removeFromSuperview()
        
        self.view.addSubview(containerView)
        containerView.backgroundColor = UIColor.white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: 0).isActive = true
        containerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        calendar.frame = containerView.bounds
        calendar.buttonMode = true
        containerView.addSubview(calendar)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.calendarBtnPressed(_:)), name: calendarBtnNotification, object: nil)
        
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.widthAnchor.constraint(equalTo: self.containerView.widthAnchor, multiplier: 1.0).isActive = true
        calendar.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
        calendar.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor).isActive = true
        calendar.heightAnchor.constraint(equalTo: self.containerView.heightAnchor).isActive = true

   

    }
    
    func calendarBtnPressed(_ notification: Notification) {
        present(TrainerMeetUpTimeVC(), animated: false, completion: nil)
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
