//
//  TrainerMeetUpTimeVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-19.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit
import FSCalendar

class TrainerMeetUpTimeVC: TrainerMeetUpDateVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        titleLbl.text = "Select a time to meet your trainer"
        
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
        calendar.scope = .week
        containerView.addSubview(calendar)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.calendarBtnPressed(_:)), name: calendarBtnNotification, object: nil)
        
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.widthAnchor.constraint(equalTo: self.containerView.widthAnchor, multiplier: 1.0).isActive = true
        calendar.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
        calendar.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        calendar.heightAnchor.constraint(equalTo: self.containerView.heightAnchor, multiplier: 0.4).isActive = true
        
        let row1 = addSelectionBtnRow(anchor: containerView.topAnchor, constant: 120)
        
        let row2 = addSelectionBtnRow(anchor: row1, constant: 0)
        
        let row3 = addSelectionBtnRow(anchor: row2, constant: 0)
        
        let row4 = addSelectionBtnRow(anchor: row3, constant: 0)
        
        let row5 = addSelectionBtnRow(anchor: row4, constant: 0)
        
        nextBtn.removeFromSuperview()
        
        nextBtn.setImage(#imageLiteral(resourceName: "right_arrow_green_bt"), for: .normal)
        self.view.addSubview(nextBtn)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo:  self.view.bottomAnchor, constant: -20).isActive = true
        nextBtn.trailingAnchor.constraint(equalTo:  self.view.trailingAnchor, constant: -20).isActive = true
        nextBtn.addTarget(self, action: #selector(self.nextBtnPressed), for: .touchUpInside)

        
    }
    
    override func nextBtnPressed() {
        present(TrainerMeetConfirmVC(), animated: true, completion: nil)
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
